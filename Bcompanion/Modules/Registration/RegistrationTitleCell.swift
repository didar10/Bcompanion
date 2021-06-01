//
//  RegistrationTitleCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class RegistrationTitleCell: BaseTableViewCell {
    override class func description() -> String {
        return "RegistrationTitleCell"
    }
    
    let titleLabel = UILabel()
    
    override func setupViews() {
        super.setupViews()
        configureViews()
        contentView.addSubview(titleLabel)
        titleLabel.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 32, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    private func configureViews(){
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        titleLabel.text = "Найди себе компаньона\nдля путешествий"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
    }
}
