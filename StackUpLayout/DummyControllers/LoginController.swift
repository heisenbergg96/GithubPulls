//
//  LoginController.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let dpLabel = UILabel()
    
    let changeProfile = UILabel()
    
    let firstName = UILabel()
    
    let lastName = UILabel()
    
    let username = UILabel()
    
    let stack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(subviews: [dpLabel, changeProfile, firstName, lastName, username])
        
        dpLabel.setSize(width: 100, height: 100)
        
        firstName.setSize(width: view.bounds.width - 40, height: 60)
        
        lastName.setSize(width: view.bounds.width - 40, height: 60)
        
        firstName.setSize(width: view.bounds.width - 40, height: 60)
        
        
        username.setSize(width: view.bounds.width - 40, height: 60)
        
        [dpLabel, changeProfile, firstName, lastName, username].forEach { stack.addArrangedSubview($0) }
        
        stack.axis = .vertical
        stack.alignment = .center
        
        stack.distribution = .fill
        
        [firstName, lastName, username].forEach {
            $0.backgroundColor = Colors.lessBlack
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 8
            $0.layer.masksToBounds = true
            $0.text = " Diana"
            $0.textAlignment = .center
            $0.textColor = Colors.someTextColor
            $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            
        }
        view.backgroundColor = Colors.moreBlack
        
        view.addSubviews(subviews: [stack])
        
        stack.spacing = 16
        
        
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                     left: view.leadingAnchor,
                     right: view.trailingAnchor,
                     padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0))
        
        dpLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        dpLabel.text = "DP"
        dpLabel.backgroundColor = Colors.dpColor
        dpLabel.textAlignment = .center
        dpLabel.textColor = .white
        
        dpLabel.layer.cornerRadius = 50
        dpLabel.layer.masksToBounds = true
        
        changeProfile.text = "Change profile picture"
        changeProfile.textColor = Colors.someTextColor
        
        stack.setCustomSpacing(40, after: changeProfile)
    }
}

