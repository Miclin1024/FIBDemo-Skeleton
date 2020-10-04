//
//  AuthItemTextField.swift
//  FIBDemo
//
//  Created by Michael Lin on 10/3/20.
//

import UIKit

class AuthItemTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor(hex: "#f7f7f7")
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
        font = UIFont.SFProDisplay(type: .semibold, size: 13)
        textColor = UIColor(hex: "#5f5f5f")
        borderStyle = .none
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 20, dy: 0)
    }

}
