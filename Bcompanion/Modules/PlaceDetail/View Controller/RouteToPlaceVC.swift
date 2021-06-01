//
//  RouteToPlaceVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class RouteToPlaceVC: UIViewController {

    let tableView = UITableView(frame: .zero)
    
    var viewModel: RouteToPlaceViewModel
    
    init(viewModel: RouteToPlaceViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        callToViewModelForUIUpdate()
    }
    
    private func setupTableView(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                            paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        [RouteByCarCell.self, RouteByWalkingCell.self].forEach { (cell) in
            tableView.register(cell, forCellReuseIdentifier: cell.description())
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func callToViewModelForUIUpdate(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension RouteToPlaceVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RouteByCarCell.description(), for: indexPath) as! RouteByCarCell
            cell.placeModel = viewModel.placeRoute
            return cell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RouteByWalkingCell.description(), for: indexPath) as! RouteByWalkingCell
            cell.placeModel = viewModel.placeRoute
            return cell
        }
    }
    
    
}

extension RouteToPlaceVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
