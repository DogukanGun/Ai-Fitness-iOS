//
//  WorkoıutDetailVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import Foundation
import UIKit

class WorkoutDetailVC:UIViewController{
    
    @IBOutlet weak var startWorkoutButton: UIButton!
    var workout:Workout? = nil
    
    override func viewDidLoad() {
        tabBarController?.tabBar.isHidden = true
        navigationItem.setNavigationBar()
        navigationController?.setBarButtons(navigationItem: navigationItem)
        startWorkoutButton.reshape()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
}
