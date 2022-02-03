//
//  MainpageRouter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/29/21.
//

import Foundation


class MainpageRouter:PresenterToRouterMainpageProtocol{
    static func createModule(ref: MainpageVC) {
        let presenter = MainpagePresenter()
        ref.presenter = presenter
        ref.presenter?.view = ref
        ref.presenter?.interactor = MainpageInteractor()
        ref.presenter?.interactor?.presenter = presenter
    }
    
    
}
