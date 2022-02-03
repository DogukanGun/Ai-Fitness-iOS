//
//  WorkoutInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation

class WorkoutInteractor:PresenterToInteractorWorkoutProtocol{
    func getWorkouts() {
        var workouts = [Workout]()
        let sportMovement = Workout(title: "Sport", imageBase64Form: ImageExample.image)
        workouts.append(sportMovement)
        workouts.append(sportMovement)
        workouts.append(sportMovement)
        workouts.append(sportMovement)
        presenter?.sendWorkouts(workouts: workouts)
    }
    
    var presenter: InteractorToPresenterWorkoutProtocol?
     
}

