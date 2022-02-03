//
//  MainpageProtocols.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation


//main protocols
protocol ViewToPresenterMainpageProtocol{
    var interactor:PresenterToInteractorMainpageProtocol? {get set}
    var view:PresenterToViewMainpageProtocol? {get set}
    
    func getAllData()
    
}

protocol PresenterToInteractorMainpageProtocol{
    var presenter:InteractorToPresenterMainpageProtocol? {get set}
    func getAllData()
}

//helper protocols
protocol InteractorToPresenterMainpageProtocol{
    func sendDataToPresenter(data:[Workout])
    
}

protocol PresenterToViewMainpageProtocol{
    func sendDataToView(data:[Workout])
    
}

//router protocol

protocol PresenterToRouterMainpageProtocol{
    static func createModule(ref:MainpageVC)
}
