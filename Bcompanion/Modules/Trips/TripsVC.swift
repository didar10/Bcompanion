//
//  TripsVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class TripsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    fileprivate func setupViews(){
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Походы"
    }
}
