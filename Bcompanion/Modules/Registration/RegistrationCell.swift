//
//  RegistrationCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/24/21.
//

import UIKit

class RegistrationCell: BaseTableViewCell {

    override class func description() -> String {
        return "RegistrationCell"
    }
    
    
    let nameTextField = CustomTextField(placeHolder: "Имя")
    let surNameTextField = CustomTextField(placeHolder: "Фамилия")
    let dateOfBirthTextField = CustomDateTextField(placeHolder: "Дата рождения")
    let cityTextField = CustomTextField(placeHolder: "Город или регион")
    let emailTextField = CustomTextField(placeHolder: "Адрес элетронной почты")
    let phoneTextField = CustomTextField(placeHolder: "Тел номер")
    
    let registrButton = UIButton(type: .system)
    
    let cityPicker = UIPickerView()
    
    lazy var stackView = UIStackView(arrangedSubviews: [nameTextField, surNameTextField, dateOfBirthTextField, cityTextField, emailTextField, phoneTextField])
    
    var citiesArray : [String]? {
        didSet {
            setupPickerView()
        }
    }
    
    override func setupViews() {
        super.setupViews()
       configureViews()
        contentView.addSubview(stackView)
        contentView.addSubview(registrButton)
        stackView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32)
        registrButton.setAnchor(top: stackView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 56, paddingLeft: 32, paddingBottom: -16, paddingRight: 32)
    }
    
    private func configureViews(){
        registrButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        registrButton.layer.cornerRadius = 20
        registrButton.backgroundColor = Colors.btnGreen
        registrButton.setTitle("Зарегистрироваться", for: .normal)
        registrButton.setTitleColor(.white, for: .normal)
        registrButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 15)
        registrButton.setCellShadow()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        [nameTextField, surNameTextField, dateOfBirthTextField, cityTextField, emailTextField, phoneTextField].forEach { (txt) in
            txt.alpha = 0.7
        }
    }
    
    private func setupPickerView(){
        cityTextField.inputView = cityPicker
        cityPicker.dataSource = self
        cityPicker.delegate = self
    }

}

extension RegistrationCell: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesArray?.count ?? 0
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     return citiesArray?[row]
    }

    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityTextField.text = citiesArray?[row]
    }
    
}
