//
//  WorkoutInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation
import Alamofire

class WorkoutInteractor:PresenterToInteractorWorkoutProtocol{
    
    var presenter: InteractorToPresenterWorkoutProtocol?

    func getWorkouts() {
        AF.request(NetworkUrl.getAllWorkouts, method: .post,headers: NetworkUrl.getHeader())
            .responseDecodable(of: [Workout].self){ response in
                do{
                    self.presenter?.sendWorkouts(workouts: response.value ?? [Workout]()) 
                }catch{
                    print(error)
                }
        }
     
    }
    
     
}

