//
//  GroupsCell.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit

class GroupsCell: BaseCollectionViewCell {
    override class func description() -> String {
        return "GroupsCell"
    }
    
    lazy var groupImageView = CustomRoundedImageView(
        frame: CGRect(x: 0, y: 0, width: frame.width, height: 120))
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    var groupModel : Group? {
        didSet {
            generateCell()
        }
    }
    
    override func setupViews() {
        super.setupViews()
        configureViews()
        [groupImageView, titleLabel, descriptionLabel].forEach { (view) in
            contentView.addSubview(view)
        }
        groupImageView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor,
                                 bottom: nil, right: contentView.rightAnchor,
                                 paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 120)
        
        titleLabel.setAnchor(top: groupImageView.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 8, paddingLeft: 24, paddingBottom: 0, paddingRight: 16)
        
        descriptionLabel.setAnchor(top: titleLabel.bottomAnchor, left: contentView.leftAnchor, bottom: nil, right: contentView.rightAnchor, paddingTop: 4, paddingLeft: 24, paddingBottom: 0, paddingRight: 16)
    }
    
    private func configureViews(){
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.setCellShadow()
        groupImageView.contentMode = .scaleAspectFill
        titleLabel.font = UIFont(name: "Helvetica", size: 16)
        titleLabel.textAlignment = .left
        descriptionLabel.font = UIFont(name: "Helvetica", size: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.textAlignment = .left
    }
    
    func generateCell(){
        if let url = URL(string: groupModel?.groupPhoto ?? "") {
            groupImageView.loadImage(from: url)
        }
        guard let membersNumber = groupModel?.numberOfMembers else { return }
        guard let tripsNumber = groupModel?.numberOfHikes else { return }
        titleLabel.text = groupModel?.groupName
        descriptionLabel.text = "\(membersNumber) участников \(tripsNumber) походов"
    }
}
