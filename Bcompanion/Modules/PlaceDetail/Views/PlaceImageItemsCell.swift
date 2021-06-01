//
//  PlaceImageItemsCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class PlaceImageItemsCell: BaseCollectionViewCell {
    override class func description() -> String {
        return "PlaceImageItemsCell"
    }
    
    lazy var placeImageView: CustomRoundedImageView = {
        let img = CustomRoundedImageView(
            frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    var placeImage : String? {
        didSet {
            generateCell()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(placeImageView)
        placeImageView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor,
                                 bottom: contentView.bottomAnchor, right: contentView.rightAnchor,
                                 paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    
    func generateCell(){
        if let url = URL(string: placeImage ?? "") {
            placeImageView.loadImage(from: url)
        }
    }
}
