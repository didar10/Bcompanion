//
//  UINavigationController + Extensions.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

extension UINavigationController {
    func transparentNavigationController(){
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 16)!]
    }
    
//    func addBackButton() -> UIBarButtonItem{
//        let menuButton = UIButton(type: .system)
//        menuButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        menuButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
//        menuButton.layer.cornerRadius = 9
//        menuButton.backgroundColor = .white
//        menuButton.setImage(#imageLiteral(resourceName: "backBtn").withRenderingMode(.alwaysOriginal), for: .normal)
//        menuButton.setCellShadow()
//        menuButton.addTarget(navigationController, action: #selector(popNavigationControllerTapped), for: .touchUpInside)
//        let backBTN = UIBarButtonItem()
//        backBTN.customView = menuButton
//        return backBTN
//    }
    
//    @objc func popNavigationControllerTapped(){
//        self.popViewController(animated: true)
//    }
}
