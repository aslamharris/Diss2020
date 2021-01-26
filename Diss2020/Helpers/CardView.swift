//
//  CardView.swift
//  Diss2020
//
//  Created by Harris Aslam on 26/03/2020.
//  Copyright © 2020 Harris Aslam. All rights reserved.
//

import UIKit

    @IBDesignable class CardView: UIView {

        @IBInspectable var cornerRadius : CGFloat = 10
        
        @IBInspectable var shadowOffSetWidth : CGFloat = 0
        
        @IBInspectable var shadowOffSetHeight : CGFloat = 5
        
        @IBInspectable var shadowColor : UIColor = UIColor.black
        
        @IBInspectable var shadowOpacity : CGFloat = 0.6
        
    
        
        override func layoutSubviews() {
            
            layer.cornerRadius = cornerRadius
            
            layer.shadowColor = shadowColor.cgColor
            
            layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
            
            let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
            
            layer.shadowPath = shadowPath.cgPath
            
            layer.shadowOpacity = Float(shadowOpacity)
            
        }

}
