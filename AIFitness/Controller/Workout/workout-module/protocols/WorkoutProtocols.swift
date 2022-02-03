//
//  WorkoutProtocols.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation


//main protocols

protocol ViewToPresenterWorkoutProtocol{
    var interactor:PresenterToInteractorWorkoutProtocol? {get set}
    var view:PresenterToViewWorkoutProtocol? {get set}
    func getWorkouts()
}

protocol PresenterToInteractorWorkoutProtocol{
    var presenter:InteractorToPresenterWorkoutProtocol? {get set}
    func getWorkouts()
}

//helper protocol

protocol InteractorToPresenterWorkoutProtocol{
    func sendWorkouts(workouts:[Workout])
}

protocol PresenterToViewWorkoutProtocol{
    func sendWorkouts(workouts:[Workout])
}

//router

protocol PresenterToRouterWorkoutProtocol{
    static func createModule(ref:WorkoutVC)
}
