//
//  CustomButton.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 15/12/22.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        
        setTitle("Launch", for: .normal)
        clipsToBounds = true
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        layer.cornerRadius = 25
        backgroundColor = .blue
    }
}
