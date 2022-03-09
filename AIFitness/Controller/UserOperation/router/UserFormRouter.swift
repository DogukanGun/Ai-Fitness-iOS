//
//  UserFormRouter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation


class UserFormRouter:PresenterToRouterUserOperationProtocol{
    static func createModule(ref: UserFormVC) {
        let preseter = UserFormPresenter()
        ref.presenter = preseter
        ref.presenter?.view = ref
        ref.presenter?.interactor = UserFormInteractor()
        ref.presenter?.interactor?.presenter = preseter
    }
    
}
