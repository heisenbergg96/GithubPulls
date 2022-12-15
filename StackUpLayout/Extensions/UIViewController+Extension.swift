//
//  UIViewController+Extension.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func addChildVC(controller: UIViewController, frame: CGRect) {
        
        view.addSubview(controller.view)
        addChild(controller)
        controller.view.frame = frame
        controller.didMove(toParent: self)
    }
}
