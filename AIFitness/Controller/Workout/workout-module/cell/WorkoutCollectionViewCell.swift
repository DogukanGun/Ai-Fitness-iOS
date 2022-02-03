//
//  WorkoutCollectionViewCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {

    var delegate:WorkoutCellDelegate? = nil
    private var workout:Workout? = nil
    
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func refresh(workout:Workout){
        workoutButton.reshape()
        if let workoutName = workout.title{
            workoutLabel.text = workoutName
        }
        self.workout = workout
    }
    @IBAction func workoutCellClicked(_ sender: Any) {
        if let workout = workout {
            delegate?.workoutItemClicked(workout: workout)
        }
    }
    
}
