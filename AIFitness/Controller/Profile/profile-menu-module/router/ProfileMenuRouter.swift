//
//  ProfileMenuRouter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation


class ProfileMenuRouter:PresenterToRouterProfileMenuProtocol{
    static func createModule(ref: ProfileMenuVC) {
        let presenter = ProfileMenuPresenter()
        
        ref.presenter = presenter
        ref.presenter?.interactor = ProfileMenuInteractor()
        ref.presenter?.view = ref
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
