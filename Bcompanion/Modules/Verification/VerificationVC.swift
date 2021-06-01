//
//  VerificationVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 6/1/21.
//

import UIKit
import FirebaseAuth

class VerificationVC: UIViewController {
    
    let mainView = VerificationView()
    
    var verificationId: String
    var phoneNumber: String
    
    var dataManager: DataManager
    
    init(verificationId: String, phoneNumber: String, dataManager: DataManager){
        self.verificationId = verificationId
        self.phoneNumber = phoneNumber
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Phone is", phoneNumber)
        setupViews()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
   
    private func setupViews(){
        view.backgroundColor = .white
        mainView.viewController = self
        mainView.backButton.addTarget(self, action: #selector(closePage), for: .touchUpInside)
        mainView.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc func closePage(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func sendButtonTapped(){
        verifyCode()
    }
    
    private func verifyCode(){
        guard let verificationCode = mainView.phoneTextField.text else {return}
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId, verificationCode: verificationCode)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                let authError = error as NSError
                print(authError.description)
                return
            } else {
                self.dataManager.callingGetToken(phone: self.phoneNumber) { (isSuccess, token) in
                    if isSuccess {
                        TokensDefaults.save(access: token)
                        let tabbar = MainTabBarController()
                        tabbar.modalPresentationStyle = .fullScreen
                        self.present(tabbar, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
