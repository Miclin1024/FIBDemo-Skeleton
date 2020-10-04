//
//  HOTVButton.swift
//  FIBDemo
//
//  Created by Michael Lin on 10/3/20.
//

import UIKit

class HOTVButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = UIColor.HOTVPrimary
        titleLabel?.font = UIFont.SFProDisplay(type: .bold, size: 15)
        tintColor = .white
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }

}
