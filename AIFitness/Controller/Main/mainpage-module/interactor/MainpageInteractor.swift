//
//  MainpageInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation
import Alamofire

class MainpageInteractor:PresenterToInteractorMainpageProtocol{
    var presenter: InteractorToPresenterMainpageProtocol?
    
    func getAllData() {
        AF.request(NetworkUrl.getAllWorkouts, method: .post,headers: NetworkUrl.getHeader())
            .responseDecodable(of: [Workout].self){ response in
                do{
                    self.presenter?.sendDataToPresenter(data: response.value ?? [Workout]()) 
                }catch{
                    print(error)
                }
        }
    }
    
    func searchData(word: String) {
        AF.request(NetworkUrl.getWorkoutsByName+word, method: .post,headers: NetworkUrl.getHeader())
            .responseDecodable(of: [Workout].self){ response in
                do{
                    self.presenter?.sendDataToPresenter(data: response.value ?? [Workout]())
                }catch{
                    print(error)
                }
        }
    }
    
}
