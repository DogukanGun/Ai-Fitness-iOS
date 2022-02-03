//
//  MainpageInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation

class MainpageInteractor:PresenterToInteractorMainpageProtocol{
    var presenter: InteractorToPresenterMainpageProtocol?
    
    func getAllData() {
        var list = [Workout]()
        let sportMovement = Workout(title: "Sport", imageBase64Form: ImageExample.image)
        list.append(sportMovement)
        list.append(sportMovement)
        list.append(sportMovement)
        list.append(sportMovement)
        presenter?.sendDataToPresenter(data:list)
    }
}
