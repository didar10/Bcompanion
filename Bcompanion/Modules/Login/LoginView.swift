//
//  LoginView.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class LoginView: UIView {

    weak var viewController: LoginVC? {
        didSet {
            setupViewControllerContainerView()
        }
    }
    
    lazy var backgroundImageView = UIImageView(
        frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 400))
    lazy var darkeningView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 400))
    
    lazy var titleLabel = UILabel()
    
    let containerView = UIView()
    
    let phoneTextField = CustomTextField(placeHolder: "Телефонный номер")
    
    let signInButton = UIButton(type: .system)
    
    let registratinButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
       
        configureViews()
        
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(darkeningView)
        darkeningView.addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(phoneTextField)
        containerView.addSubview(signInButton)
        containerView.addSubview(registratinButton)
        signInButton.setCellShadow()
        backgroundImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: 400)
        darkeningView.setAnchor(top: backgroundImageView.topAnchor, left: backgroundImageView.leftAnchor, bottom: backgroundImageView.bottomAnchor, right: backgroundImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        containerView.setAnchor(top: backgroundImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    
        titleLabel.setAnchor(top: darkeningView.safeAreaLayoutGuide.topAnchor, left: darkeningView.leftAnchor, bottom: nil, right: darkeningView.rightAnchor, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        phoneTextField.setAnchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 30, paddingLeft: 32, paddingBottom: 0, paddingRight: 32)
        signInButton.setAnchor(top: phoneTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200 ,height: 40)
        signInButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        registratinButton.setAnchor(top: nil, left: nil, bottom: containerView.safeAreaLayoutGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: -20, paddingRight: 0)
        registratinButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    
    private func configureViews(){
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 40
        backgroundImageView.image = #imageLiteral(resourceName: "mountains")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.masksToBounds = true
        darkeningView.backgroundColor = .black
        darkeningView.alpha = 0.5
        
        phoneTextField.keyboardType = .numberPad
        
        signInButton.layer.cornerRadius = 20
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.setTitle("Войти", for: .normal)
        signInButton.backgroundColor = Colors.btnGreen
        
        registratinButton.setTitle("Нету аккаунта?", for: .normal)
        registratinButton.setTitleColor(Colors.textGreen, for: .normal)
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        titleLabel.text = "Найди себе компаньона\nдля путешествий"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
    

    private func setupViewControllerContainerView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let vc = viewController {
            vc.view.addSubview(self)
            self.setAnchor(top: vc.view.topAnchor, left: vc.view.leftAnchor, bottom: vc.view.bottomAnchor, right: vc.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        }
    }
}
