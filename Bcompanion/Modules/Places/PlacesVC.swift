//
//  PlacesVC.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class PlacesVC: UIViewController {
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    var viewModel: PlacesViewModel
    
    init(viewModel: PlacesViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        callToViewModelForUIUpdate()
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
        navigationItem.title = "Места"
    }
    
    private func setupCollectionView(){
        collectionView.register(PlacesCell.self, forCellWithReuseIdentifier: PlacesCell.description())
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func callToViewModelForUIUpdate(){
        viewModel.bindPlacesToController = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
}

extension PlacesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let name = viewModel.placesArray?[indexPath.item].placeName {
            let vc = PlaceDetailVC(navigationTitle: name)
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            nav.modalTransitionStyle = .crossDissolve
            self.present(nav, animated: true, completion: nil)
        }
    }
}

extension PlacesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.placesArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlacesCell.description(), for: indexPath) as! PlacesCell
        if let model = viewModel.placesArray?[indexPath.item] {
            cell.placeModel = model
        }
        return cell
    }
    
    
}

extension PlacesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 36, height: 180)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        
        return UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        
        
    }
}
