//
//  WorkoutCollectionViewCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import UIKit

struct WorkoutCollectionViewCellVariable{
    static let cornerRadious = CGFloat(20)
    static let buttonCornerRadious = CGFloat(12)
    static let buttonTextFont = CGFloat(16)
}


class WorkoutCollectionViewCell: UICollectionViewCell {

    var delegate:WorkoutCellDelegate? = nil
    private var workout:Workout? = nil
    
    @IBOutlet weak var wrapper: UIView!
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var workoutLabel: UILabel!
    @IBOutlet weak var workoutImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func refresh(workout:Workout){
        workoutButton.reshape()
        if let workoutName = workout.workoutName{
            workoutLabel.text = workoutName
        }
        self.workout = workout
        wrapper.layer.cornerRadius = WorkoutCollectionViewCellVariable.cornerRadious
        let attributeString = NSAttributedString(string: self.workoutButton!.titleLabel?.text ?? "", attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: WorkoutCollectionViewCellVariable.buttonTextFont)])
        workoutButton.setAttributedTitle(attributeString, for: .normal)
        workoutButton.layer.cornerRadius = WorkoutCollectionViewCellVariable.buttonCornerRadious
    }
    @IBAction func workoutCellClicked(_ sender: Any) {
        if let workout = workout {
            delegate?.workoutItemClicked(workout: workout)
        }
    }
    
}
