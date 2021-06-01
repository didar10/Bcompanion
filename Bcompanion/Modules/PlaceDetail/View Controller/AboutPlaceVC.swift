//
//  AboutPlaceVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class AboutPlaceVC: UIViewController {
    
    let tableView = UITableView(frame: .zero)
    
    var viewModel: AboutPlaceViewModel
    
    init(viewModel: AboutPlaceViewModel){
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
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                            paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        [PlaceImagesTVCell.self, PlaceDescriptionCell.self].forEach { (cell) in
            tableView.register(cell, forCellReuseIdentifier: cell.description())
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
   
    private func callToViewModelForUIUpdate(){
        viewModel.bindPlaceDescriptionToController = {
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 1), with: .fade)
            }
        }
        
        viewModel.bindPlaceImagesToController = {
            DispatchQueue.main.async {
                self.tableView.reloadSections(IndexSet(integer: 0), with: .fade)
            }
        }
    }

}

extension AboutPlaceVC: UITableViewDataSource {
    
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
                withIdentifier: PlaceImagesTVCell.description(), for: indexPath) as! PlaceImagesTVCell
            cell.imagesModel = viewModel.placeImages
            return cell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: PlaceDescriptionCell.description(), for: indexPath) as! PlaceDescriptionCell
            cell.placeModel = viewModel.placeDescription
            return cell
        }
    }
    
    
}

extension AboutPlaceVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
