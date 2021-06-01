//
//  LoginVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    let mainView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    fileprivate func setupViews(){
        view.backgroundColor = .white
        mainView.viewController = self
        mainView.signInButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        mainView.registratinButton.addTarget(self, action: #selector(registrationTapped), for: .touchUpInside)
        mainView.phoneTextField.delegate = self
    }
    
    @objc fileprivate func loginTapped(){
        loginPhoneAuthentication()
    }
    
    private func loginPhoneAuthentication(){
        
        guard let phoneTxt = mainView.phoneTextField.text else { return }
        let unFormattedPhone = format(with: "+XXXXXXXXXXX", phone: phoneTxt)
        Auth.auth().languageCode = "ru"
        
        PhoneAuthProvider.provider().verifyPhoneNumber(unFormattedPhone, uiDelegate: nil) { (verificationId, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let verificationID = verificationId else { return }
            print("Ver is", verificationId as Any)
            print("Verification id is", verificationID)
            if !verificationID.isEmpty{
                let vc = VerificationVC(verificationId: verificationID, phoneNumber: unFormattedPhone, dataManager: DataManager())
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    @objc fileprivate func registrationTapped(){
        let vc = RegistrationVC(viewModel: RegistrationViewModel(dataManager: DataManager()))
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension LoginVC: UITextFieldDelegate {
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                result.append(numbers[index])
                index = numbers.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+X (XXX) XXX-XX-XX", phone: newString)
        return false
    }
}
