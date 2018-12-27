//
//  designableView.swift
//  WeatherApp
//
//  Created by Sumit Parmar on 27/12/18.
//  Copyright © 2018 Sumit Parmar. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

@IBDesignable open class designableView: UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
