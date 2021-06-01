//
//  PlaceDetailVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Tabman
import Pageboy
import UIKit

class PlaceDetailVC: TabmanViewController {
    
    

    lazy var viewControllers = [AboutPlaceVC(viewModel: AboutPlaceViewModel(dataManager: DataManager(), placeName: navigationTitle)), RouteToPlaceVC(viewModel: RouteToPlaceViewModel(dataManager: DataManager(), placeName: navigationTitle)), WeatherOnPlaceVC()]
    
    var navigationTitle: String
    
    let closeButton = UIButton(type: .close)
    
    init(navigationTitle: String){
        self.navigationTitle = navigationTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.transparentNavigationController()
        view.backgroundColor = .white
        self.dataSource = self
        // Create bar
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        // Add to view
        
        addBar(bar, dataSource: self, at: .top)
        
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        bar.buttons.customize { (button) in
            button.backgroundColor = .clear
            button.tintColor = Colors.chatTimeGrayGreen
            button.selectedTintColor = Colors.btnGreen
            button.font = UIFont(name: "Helvetica", size: 16)!
        }
        
        bar.indicator.tintColor = Colors.textGreen
        bar.indicator.weight = .light
        
        self.navigationItem.title = navigationTitle
        
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = closeButton
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        closeButton.addTarget(self, action: #selector(closePage), for: .touchUpInside)
    }
    
    @objc func closePage(){
        dismiss(animated: true, completion: nil)
    }
}
extension PlaceDetailVC: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "Описание")
        case 1:
            return TMBarItem(title: "Как доехать?")
        default:
            return TMBarItem(title: "Погода")
        }
       
    }
}
