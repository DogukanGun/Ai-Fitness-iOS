//
//  UserFormPresenter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation

class UserFormPresenter:ViewToPresenterUserOperationProtocol{
    var interactor: PresenterToInteractorUserOperationProtocol?
    
    var view: PresenterToViewUserOperationProtocol?
    
    func register(registerRequest: RegisterRequest) {
        interactor?.register(registerRequest: registerRequest)
    }
    
    func login(loginRequest: LoginRequest) {
        interactor?.login(loginRequest: loginRequest)
    }
}

extension UserFormPresenter:InteractorToPresenterUserOperationProtocol{
    func response(response: UserResponse) {
        view?.response(response: response)
    }
}
