//
//  ProfileMenuProtocols.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation


// main protocol
protocol PresenterToInteractorProfileMenuProtocol{
    var presenter:InteractorToPresenterProfileMenuProtocol? {get set}
    
    func getSubMenuItem(menu:MenuItem)
    func getAllMenu()
    
}

protocol ViewToPresenterProfileMenuProtocol{
    var interactor:PresenterToInteractorProfileMenuProtocol? {get set}
    var view:PresenterToViewProfileMenuProtocol? {get set}
    
    func getSubMenuItem(menu:MenuItem)
    func getAllMenu()
}

//helper protocol
protocol InteractorToPresenterProfileMenuProtocol{
    func sendMenuItem(menuItems:[MenuItem])
}

protocol PresenterToViewProfileMenuProtocol{
    func sendMenuItem(menuItems:[MenuItem])
}

//router
protocol PresenterToRouterProfileMenuProtocol{
    static func createModule(ref:ProfileMenuVC)
}
