//
//  PlaceDescriptionCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class PlaceDescriptionCell: BaseTableViewCell {
    override class func description() -> String {
        return "PlaceDescriptionCell"
    }
    
    let placeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica", size: 14)
        return label
    }()
    
    var placeModel : PlaceDescription? {
        didSet {
            generateCell()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(placeDescriptionLabel)
        placeDescriptionLabel.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor,
                                        bottom: contentView.bottomAnchor, right: contentView.rightAnchor,
                                        paddingTop: 16, paddingLeft: 16, paddingBottom: -16, paddingRight: 16)
    }
    
    func generateCell(){
        placeDescriptionLabel.text = placeModel?.placeDescription
    }
}
