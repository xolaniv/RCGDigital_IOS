//
//  Utilities.swift
//  RGG_Digital
//
//  Created by Xolani VILAKAZI on 2020/01/16.
//  Copyright © 2020 Xolani VILAKAZI. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1)
    let secondaryColor = UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1)
    static func styledTextField(_ textfield:UITextField)
    {
        
        //Create Bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.systemPink.cgColor
        
        //Remove border on textfield
        textfield.borderStyle = .none
        
        //Add line to the textfield
        textfield.layer.addSublayer(bottomLine)
        
    }
    static func styledFilledButton(_ button:UIButton)
    {
        //Filled rounded corner style
        button.backgroundColor = UIColor.systemTeal
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    static func styleHollowButton(_ button: UIButton)
    {
        //Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.tintColor = UIColor.black
        button.layer.cornerRadius = 25.0
    }
    /*static func isPassword(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z)(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }*/
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        return passwordTest.evaluate(with: password)
    }
    
    static var VerticalGradientLayer:CAGradientLayer = {
        let primaryColor = UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 1)
        let secondaryColor = UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 1)
        let gradient = CAGradientLayer()
        gradient.frame = CGRect.zero
        gradient.colors = [primaryColor.cgColor,
                           secondaryColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        return gradient
    }()
    
    
    /*static func addVerticalGradientLayer(topColor:UIColor, bottomColor:UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [
            topColor.cgColor,
            bottomColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradient, at: 0)
    }*/
}
