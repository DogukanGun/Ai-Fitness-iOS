//
//  WorkoıutDetailVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import Foundation
import UIKit

class WorkoutDetailVC:UIViewController{
    
    @IBOutlet weak var workoutIntensity: UILabel!
    @IBOutlet weak var workoutTime: UILabel!
    @IBOutlet weak var workoutLevel: UILabel!
    @IBOutlet weak var workoutName: UILabel!
    @IBOutlet weak var startWorkoutButton: UIButton!
    var workout:Workout? = nil
    
    override func viewDidLoad() {
        tabBarController?.tabBar.isHidden = true
        navigationItem.setNavigationBar()
        navigationController?.setBarButtons(navigationItem: navigationItem)
        startWorkoutButton.reshape()
        updateUI()
    }
    
    @IBAction func startWorkoutButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "UploadWorkoutVC", sender: workout?.id)
    }
    
    private func updateUI(){
        if let workout = workout, let rating = workout.workoutRating {
            workoutName.text = workout.workoutName
            workoutTime.text = String(rating)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
}
