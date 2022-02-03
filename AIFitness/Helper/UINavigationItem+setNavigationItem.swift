//
//  UINavigationItem+setNavigationItem.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import Foundation
import UIKit

extension UINavigationItem{
    func setNavigationBar(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = UIColor(named: "TabbarColor")
        standardAppearance.titleTextAttributes = textAttributes
        self.title = Constants.appName
        self.standardAppearance = standardAppearance
        self.compactAppearance = standardAppearance
        self.scrollEdgeAppearance = standardAppearance
        self.compactScrollEdgeAppearance = standardAppearance
    }
}
