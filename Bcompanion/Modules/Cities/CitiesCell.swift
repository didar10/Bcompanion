//
//  CitiesCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class CitiesCell: BaseCollectionViewCell {
    override class func description() -> String {
        return "CitiesCell"
    }
    
    lazy var cityImageView = CustomRoundedImageView(
        frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
    
    let cityNameLabel = UILabel()
    
    var cityModel : City? {
        didSet {
            generateCell()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        configureView()
        contentView.addSubview(cityImageView)
        contentView.addSubview(cityNameLabel)
        cityImageView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        cityNameLabel.setAnchor(top: nil, left: contentView.leftAnchor, bottom: cityImageView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 24, paddingBottom: -8, paddingRight: 24)
    }
    
    private func configureView(){
        self.setCellShadow()
        self.layer.cornerRadius = 20
        cityImageView.contentMode = .scaleAspectFill
        cityNameLabel.textAlignment = .left
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        cityNameLabel.textColor = .white
    }
    
    func generateCell(){
        if let url = URL(string: cityModel?.cityPhoto ?? "") {
            cityImageView.loadImage(from: url)
        }
        cityNameLabel.text = cityModel?.cityName
    }
}
