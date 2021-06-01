//
//  RouteByCarCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class RouteByCarCell: BaseTableViewCell {
    override class func description() -> String {
        return "RouteByCarCell"
    }
    
    lazy var carImageView = CustomRoundedImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 250))
    
    let descriptionLabel = UILabel()
    
    let titleLabel = UILabel()
    
    var placeModel : PlaceRoute? {
        didSet {
            generateCell()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        configureViews()
        [carImageView, titleLabel ,descriptionLabel].forEach { (view) in
            contentView.addSubview(view)
        }
        
        titleLabel.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        
        carImageView.setAnchor(top: titleLabel.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: self.frame.width, height: 250)
        descriptionLabel.setAnchor(top: carImageView.bottomAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: -16, paddingRight: 16)
    }
    
    private func configureViews(){
        titleLabel.text = "На транспорте"
        titleLabel.font = UIFont(name: "Helvetica", size: 16)
        carImageView.image = #imageLiteral(resourceName: "byCar")
        carImageView.contentMode = .scaleAspectFill
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Helvetica", size: 14)
    }
    
    func generateCell(){
        descriptionLabel.text = placeModel?.routeByCarText
    }
}
