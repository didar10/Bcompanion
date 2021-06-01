//
//  ProfileVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/25/21.
//

import UIKit

class ProfileVC: UIViewController {
    
    let logoutButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    fileprivate func setupViews(){
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Профиль"
        
        logoutButton.setTitle("Выйти из аккаунта", for: .normal)
        logoutButton.titleLabel?.font = .systemFont(ofSize: 16)
        logoutButton.titleLabel?.textAlignment = .left
        logoutButton.setTitleColor(.black, for: .normal)
        logoutButton.buttonLeftImagee(image: UIImage(named: "ic_logout")!.withTintColor(Colors.btnGreen), renderMode: .alwaysOriginal)
        logoutButton.buttonTitlePadding(top: 0, left: 40, bottom: 0, right: 0)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        
        logoutButton.setAnchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 50)
    }
    
    @objc func logoutButtonTapped(){
        TokensDefaults.clearTokensData()
        let viewController = LoginVC()
        let nav = UINavigationController(rootViewController: viewController)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }

}

extension UIButton {
    func buttonLeftImagee(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }
    func buttonTitlePadding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
