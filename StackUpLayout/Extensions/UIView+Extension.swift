//
//  UIView+Extension.swift
//  StackUpLayout
//
//  Created by Vikhyath Shetty on 11/12/22.
//

import Foundation
import UIKit

extension UIView {
    
    public func fillSuperview() {
        
        anchor(top: superview?.topAnchor,
               bottom: superview?.bottomAnchor,
               left: superview?.leadingAnchor,
               right: superview?.trailingAnchor,
               padding: .zero,
               width: .zero,
               height: .zero)
    }
    
    public func anchor(top : NSLayoutYAxisAnchor? = nil ,
                bottom : NSLayoutYAxisAnchor? = nil ,
                left: NSLayoutXAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                width: CGFloat = 0,
                height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let right = right {
            trailingAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    public func proportionalSize(width : NSLayoutDimension? ,
                                 widthPercent : CGFloat,
                                 height: NSLayoutDimension?,
                                 heightPercent : CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if  let width = width {
            widthAnchor.constraint(equalTo: width , multiplier: widthPercent).isActive = true
        }
        
        if  let height = height {
            heightAnchor.constraint(equalTo: height , multiplier: heightPercent).isActive = true
        }
    }

    public func setSize( width : CGFloat ,  height : CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if  width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if  height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    public func center(centerX : NSLayoutXAxisAnchor? , centerY : NSLayoutYAxisAnchor?)  {
        
        self.center(centerX: centerX, paddingX: 0, centerY: centerY, paddingY: 0)
    }
    
    public func center(centerX: NSLayoutXAxisAnchor?, paddingX: CGFloat, centerY: NSLayoutYAxisAnchor?, paddingY: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
         centerXAnchor.constraint(equalTo: centerX , constant: paddingX).isActive = true
        }
        
        if let centerY = centerY {
         centerYAnchor.constraint(equalTo: centerY , constant: paddingY).isActive = true
        }
    }
    
    func addSubviews(subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
}
