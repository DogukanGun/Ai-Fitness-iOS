//
//  WorkoutRouter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation


class WorkoutRouter:PresenterToRouterWorkoutProtocol{
    static func createModule(ref: WorkoutVC) {
        let presenter = WorkoutPresenter()
        
        ref.presenter = presenter
        ref.presenter?.interactor = WorkoutInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    } 
}
