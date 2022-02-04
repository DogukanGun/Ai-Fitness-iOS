//
//  UIButton+reshape.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import Foundation
import UIKit

struct ButtonAttr{
    static let radious = CGFloat(20)
    static let buttonTextSize = CGFloat(25)
}

extension UIButton{
    func reshape(){
        self.layer.cornerRadius = ButtonAttr.radious
        self.backgroundColor = UIColor(named: "PrimaryColor")
        let attributeString = NSAttributedString(string: self.titleLabel!.text ?? "", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: CGFloat(ButtonAttr.buttonTextSize))])
        self.setAttributedTitle(attributeString, for: .normal)
        self.tintColor = UIColor.white
    }
}
