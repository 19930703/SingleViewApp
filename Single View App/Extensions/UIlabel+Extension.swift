//
//  UIlabel+Extension.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//

import UIKit

extension UILabel {
    
    func changeTextStyle(_ boldtext: String, _ regularText: String){
        
        let boldAttribute = [
           NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
        ]
        let regularAttribute = [
           NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 18.0)!
        ]
        let boldText = NSAttributedString(string: boldtext, attributes: boldAttribute)
        let regularText = NSAttributedString(string: regularText, attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        self.attributedText = newString
        
    }
    
    

}
