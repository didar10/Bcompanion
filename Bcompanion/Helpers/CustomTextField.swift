//
//  CustomTextField.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/23/21.
//

import UIKit

class CustomTextField: UITextField {
    let placeHolder : String
    init(placeHolder: String){
        self.placeHolder = placeHolder
        super.init(frame: .zero)
        layer.cornerRadius = 20
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = Colors.textFieldBorderGray.cgColor
        self.attributedPlaceholder = NSAttributedString(string: self.placeHolder, attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.systemFont(ofSize: 16)
        ])
        self.setCellShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.insetBy(dx: 16, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 16, dy: 0)
    }
    
    override var intrinsicContentSize: CGSize {
        return .init(width: 0, height: 40)
    }
}


