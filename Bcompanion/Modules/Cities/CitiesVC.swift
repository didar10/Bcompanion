//
//  CitiesVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/25/21.
//

import UIKit

class CitiesVC: UIViewController {
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()

    var viewModel: CitiesViewModel
    
    init(viewModel: CitiesViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    

    private func setupViews(){
        view.backgroundColor = .white
        setupNavigationBar()
        view.addSubview(collectionView)
        collectionView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                                 bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,
                                 paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        setupCollectionView()
    }
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Города"
    }
    
    private func setupCollectionView(){
        collectionView.register(CitiesCell.self, forCellWithReuseIdentifier: CitiesCell.description())
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

}

extension CitiesVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.citiesArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CitiesCell.description(), for: indexPath) as! CitiesCell
        if let city = viewModel.citiesArray?[indexPath.item]{
            cell.cityModel = city
        }
        return cell
    }
    
    
}

extension CitiesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
            return CGSize(width: collectionView.frame.width - 36, height: 180)
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
   

            return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
      
        
    }
}
