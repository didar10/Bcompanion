//
//  VerificationView.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 6/1/21.
//

import UIKit

class VerificationView: UIView {

    weak var viewController: VerificationVC? {
        didSet {
            setupViewControllerContainerView()
        }
    }
    
    let navBarView = UIView()
    let backButton = UIButton(type: .system)
    
    lazy var backgroundImageView = UIImageView(
        frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 400))
    lazy var darkeningView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 400))
    
    lazy var titleLabel = UILabel()
    
    let containerView = UIView()
    
    let phoneTextField = CustomTextField(placeHolder: "Введите ваш код")
    
    let sendButton = UIButton(type: .system)
    

    
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
        darkeningView.addSubview(navBarView)
        navBarView.addSubview(backButton)
        darkeningView.addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(phoneTextField)
        containerView.addSubview(sendButton)
        sendButton.setCellShadow()
        backgroundImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: 400)
        darkeningView.setAnchor(top: backgroundImageView.topAnchor, left: backgroundImageView.leftAnchor, bottom: backgroundImageView.bottomAnchor, right: backgroundImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        navBarView.setAnchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 56)
        backButton.setAnchor(top: nil, left: navBarView.leftAnchor, bottom: navBarView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 24, paddingBottom: -16, paddingRight: 0)
        containerView.setAnchor(top: backgroundImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: -40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
    
        titleLabel.setAnchor(top: darkeningView.safeAreaLayoutGuide.topAnchor, left: darkeningView.leftAnchor, bottom: nil, right: darkeningView.rightAnchor, paddingTop: 70, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        phoneTextField.setAnchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: containerView.rightAnchor, paddingTop: 30, paddingLeft: 32, paddingBottom: 0, paddingRight: 32)
        sendButton.setAnchor(top: phoneTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200 ,height: 40)
        sendButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    }
    
    private func configureViews(){
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 40
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.image = #imageLiteral(resourceName: "mountains")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.layer.masksToBounds = true
        darkeningView.backgroundColor = .black
        darkeningView.alpha = 0.5
        backButton.setImage(#imageLiteral(resourceName: "backBtn").withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        phoneTextField.keyboardType = .numberPad
        
        sendButton.layer.cornerRadius = 20
        sendButton.setTitleColor(.white, for: .normal)
        sendButton.setTitle("Отправить", for: .normal)
        sendButton.backgroundColor = Colors.btnGreen
        
       
        
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        titleLabel.text = "Мы отправили код\nна ваш номер"
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

