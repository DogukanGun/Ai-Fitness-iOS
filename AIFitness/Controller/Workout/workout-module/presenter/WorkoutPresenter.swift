//
//  WorkoutPresenter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation


class WorkoutPresenter:ViewToPresenterWorkoutProtocol{
    var interactor: PresenterToInteractorWorkoutProtocol?
    
    var view: PresenterToViewWorkoutProtocol?
        
    func getWorkouts() {
        interactor?.getWorkouts()
    }
}

extension WorkoutPresenter:InteractorToPresenterWorkoutProtocol{
    func sendWorkouts(workouts:[Workout]) {
        view?.sendWorkouts(workouts: workouts)
    }
}
