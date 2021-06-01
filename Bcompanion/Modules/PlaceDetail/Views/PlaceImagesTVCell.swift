//
//  PlaceImagesTVCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class PlaceImagesTVCell: BaseTableViewCell {
    override class func description() -> String {
        return "PlaceImagesTVCell"
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    var imagesModel : [String]? {
        didSet {
            reloadCollectionView()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(collectionView)
        collectionView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 350)
        collectionView.register(PlaceImageItemsCell.self, forCellWithReuseIdentifier: PlaceImageItemsCell.description())
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func reloadCollectionView(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension PlaceImagesTVCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height - 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 8, left: 16, bottom: 0, right: 8)
    }
}

extension PlaceImagesTVCell: UICollectionViewDataSource {
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlaceImageItemsCell.description(), for: indexPath) as! PlaceImageItemsCell
        cell.placeImage = imagesModel?[indexPath.item]
        return cell
    }
}

