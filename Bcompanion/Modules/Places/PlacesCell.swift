//
//  PlacesCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class PlacesCell: BaseCollectionViewCell {
    override class func description() -> String {
        return "PlacesCell"
    }
    
    lazy var placeImageView = CustomRoundedImageView(
        frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    
    let placeNameLabel = UILabel()
    
    var placeModel : Place? {
        didSet {
            generateCell()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        configureView()
        contentView.addSubview(placeImageView)
        contentView.addSubview(placeNameLabel)
        placeImageView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        placeNameLabel.setAnchor(top: nil, left: contentView.leftAnchor, bottom: placeImageView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 24, paddingBottom: -8, paddingRight: 24)
    }
    
    private func configureView(){
        self.setCellShadow()
        self.layer.cornerRadius = 20
        placeImageView.contentMode = .scaleAspectFill
        placeNameLabel.textAlignment = .left
        placeNameLabel.font = .boldSystemFont(ofSize: 20)
        placeNameLabel.textColor = .white
    }
    
    func generateCell(){
        if let url = URL(string: placeModel?.placePhoto ?? ""){
            placeImageView.loadImage(from: url)
        }
        placeNameLabel.text = placeModel?.placeName
    }
}

