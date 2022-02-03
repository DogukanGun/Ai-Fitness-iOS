//
//  UITabbarController+setTabbar.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import Foundation
import UIKit

extension UITabBarController{
    func setTabbar(){
        let apperance = UITabBarAppearance()
        apperance.backgroundColor = UIColor(named: "TabbarColor")
        
        self.tabBar.standardAppearance = apperance
        self.tabBar.scrollEdgeAppearance = apperance
    }
}
