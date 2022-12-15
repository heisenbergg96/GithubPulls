//
//  StackUpModel.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import Foundation
import UIKit

struct StackUpModel {
    
    let controller: UIViewController
    let ctaTitle: String
    
    static func dataSource() -> [StackUpModel] {
        
        let vc1 = PostController()
        
        let vc2 = LoginViewController()
        
        let vc3 = PostController()
        
        return [
            StackUpModel(controller: vc1, ctaTitle: "Title1"),
            StackUpModel(controller: vc2, ctaTitle: "Title2"),
            StackUpModel(controller: vc3, ctaTitle: "Title3")
        ]
    }
}
