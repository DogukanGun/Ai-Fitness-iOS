//
//  MainpagePresenter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation


class MainpagePresenter:ViewToPresenterMainpageProtocol{
    
    var interactor: PresenterToInteractorMainpageProtocol?
    
    var view: PresenterToViewMainpageProtocol?
    
    func getAllData() {
        interactor?.getAllData()
    }
    
    func searchData(word: String) {
        interactor?.searchData(word: word)
    }
    
}


extension MainpagePresenter:InteractorToPresenterMainpageProtocol{
    func sendDataToPresenter(data: [Workout]) {
        view?.sendDataToView(data: data)
    }
    
    
}
