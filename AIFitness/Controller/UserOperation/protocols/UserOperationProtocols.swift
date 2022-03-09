//
//  UserOperationProtocols.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation

protocol ViewToPresenterUserOperationProtocol{
    var interactor:PresenterToInteractorUserOperationProtocol? {get set}
    var view:PresenterToViewUserOperationProtocol? {get set}
    
    func register(registerRequest:RegisterRequest)
    func login(loginRequest:LoginRequest)
}

protocol PresenterToInteractorUserOperationProtocol{
    var presenter:InteractorToPresenterUserOperationProtocol? {get set}
    
    func register(registerRequest:RegisterRequest)
    func login(loginRequest:LoginRequest)
}

protocol InteractorToPresenterUserOperationProtocol{
    func response(response:UserResponse)
}

protocol PresenterToViewUserOperationProtocol{
    func response(response:UserResponse)
}


protocol PresenterToRouterUserOperationProtocol{
    static func createModule(ref:UserFormVC)
}
