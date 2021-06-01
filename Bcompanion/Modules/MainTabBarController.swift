//
//  MainTabBarController.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        setupViewControllers()
    }
    

    func configureTabBar(){
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.clipsToBounds = true
        tabBar.backgroundColor = .white
        tabBar.tintColor = Colors.textGreen
        tabBar.layer.cornerRadius = 25
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3.0)
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowRadius = 2.0
    }
    
    func setupViewControllers(){
        let first = templateNavController(rootViewController: TripsVC(), image: #imageLiteral(resourceName: "trips"), title: "Походы")
        let second = templateNavController(rootViewController: PlacesVC(viewModel: PlacesViewModel(dataManager: DataManager())), image: #imageLiteral(resourceName: "places").withTintColor(Colors.tabBarIconGray), title: "Места")
        let third = templateNavController(rootViewController: CitiesVC(viewModel: CitiesViewModel(dataManager: DataManager())), image: #imageLiteral(resourceName: "city2"), title: "Города")
        let fourth = templateNavController(rootViewController: GroupsVC(viewModel: GroupsViewModel(dataManager: DataManager())), image: #imageLiteral(resourceName: "groups"), title: "Группы")
        let fifth = templateNavController(rootViewController: ProfileVC(), image: #imageLiteral(resourceName: "user"), title: "Профиль")
        viewControllers = [first, second, third, fourth, fifth]
    }

    func templateNavController(rootViewController: UIViewController, image: UIImage, title: String) -> UINavigationController{
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.tabBarItem.title = title
        return navController
    }
}
