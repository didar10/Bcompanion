//
//  CustomDateTextField.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/25/21.
//

import UIKit

class CustomDateTextField: UITextField {
    
    var date: Date {
        get { return (inputView as! UIDatePicker).date }
        set { (inputView as! UIDatePicker).date = newValue }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter
    }()

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
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.addTarget(self, action: #selector(changeDate), for: .valueChanged)
        inputView = datePicker
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

    @objc func changeDate() {
        text = dateFormatter.string(from: date)
    }
}
