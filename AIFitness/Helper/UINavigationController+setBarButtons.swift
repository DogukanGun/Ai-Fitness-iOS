//
//  UINavigationController+setBarButtons.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 4.02.2022.
//

import Foundation
import UIKit

extension UINavigationController{
    func setBarButtons(navigationItem:UINavigationItem){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"gearshape.fill"), style: .done, target: self, action: #selector(self.barButtonPressed(sender:)))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "PrimaryColor")
        navigationItem.rightBarButtonItem?.tag = BarButtonPlace.RIGHT.rawValue
    }
    
    @objc func barButtonPressed(sender:Any){
        let button = sender as! UIBarButtonItem
        if button.tag == BarButtonPlace.RIGHT.rawValue{
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            self.present(vc, animated: true, completion: nil)
        }
    }
}
