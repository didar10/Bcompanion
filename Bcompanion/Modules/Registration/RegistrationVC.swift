//
//  RegistrationVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class RegistrationVC: UIViewController {
    
    let mainView = RegistrationView()
    
    var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        callToViewModelForCities()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func setupViews(){
        view.backgroundColor = .white
        mainView.viewController = self
        mainView.backButton.addTarget(self, action: #selector(closePage), for: .touchUpInside)
        mainView.tableView.register(RegistrationCell.self, forCellReuseIdentifier: RegistrationCell.description())
        mainView.tableView.register(RegistrationTitleCell.self, forCellReuseIdentifier: RegistrationTitleCell.description())
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    @objc func closePage(){
        self.navigationController?.popViewController(animated: true)
    }
    
    private func callToViewModelForCities(){
        viewModel.bindCitiesToController = {
            DispatchQueue.main.async {
                self.mainView.tableView.reloadData()
            }
        }
    }

}

extension RegistrationVC: UITableViewDataSource {
    
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
                withIdentifier: RegistrationTitleCell.description(), for: indexPath) as! RegistrationTitleCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: RegistrationCell.description(), for: indexPath) as! RegistrationCell
            cell.citiesArray = viewModel.citiesArray
            return cell
        }
    }
    
    
}

extension RegistrationVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 250
        default:
            return UITableView.automaticDimension
        }
    }
}
