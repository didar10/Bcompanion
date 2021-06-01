//
//  RegistrationView.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class RegistrationView: UIView {

    weak var viewController: RegistrationVC? {
        didSet {
            setupViewControllerContainerView()
        }
    }
    
    let navBarView = UIView()
    let backButton = UIButton(type: .system)
    lazy var backgroundImageView = UIImageView(
        frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
    lazy var darkeningView = UIView(
        frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
    let tableView = UITableView(frame: .zero)
    
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
        backgroundImageView.addSubview(tableView)
        navBarView.addSubview(backButton)
        backgroundImageView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: self.frame.width, height: self.frame.height)
        darkeningView.setAnchor(top: backgroundImageView.topAnchor, left: backgroundImageView.leftAnchor, bottom: backgroundImageView.bottomAnchor, right: backgroundImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        navBarView.setAnchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 56)
        backButton.setAnchor(top: nil, left: navBarView.leftAnchor, bottom: navBarView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 24, paddingBottom: -16, paddingRight: 0)
        
        tableView.setAnchor(top: navBarView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    private func configureViews(){
        
        backgroundImageView.layer.masksToBounds = true
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.isUserInteractionEnabled = true
        backgroundImageView.image = #imageLiteral(resourceName: "mountains")
        darkeningView.backgroundColor = .black
        darkeningView.alpha = 0.5
        
        backButton.setImage(#imageLiteral(resourceName: "backBtn").withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
        tableView.backgroundColor = .clear
    }

    private func setupViewControllerContainerView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let vc = viewController {
            vc.view.addSubview(self)
            self.setAnchor(top: vc.view.topAnchor, left: vc.view.leftAnchor, bottom: vc.view.bottomAnchor, right: vc.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        }
    }
}
