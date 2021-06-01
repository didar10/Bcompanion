//
//  CustomRoundedImageView.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import UIKit
import Kingfisher

class CustomRoundedImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.backgroundGray
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadImage(from url: URL) {
        image = nil
        
        self.kf.setImage(with: url, placeholder: nil)
        {
            result in
            switch result {
            case .success(let value):
                break
//                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        self.kf.indicatorType = .activity
    }
}
