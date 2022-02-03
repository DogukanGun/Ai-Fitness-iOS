//
//  ProfileMenuPresenter.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation

class ProfileMenuPresenter:ViewToPresenterProfileMenuProtocol{
    
    
    var interactor: PresenterToInteractorProfileMenuProtocol?
    
    var view: PresenterToViewProfileMenuProtocol?
    
    func getSubMenuItem(menu: MenuItem) {
        interactor?.getSubMenuItem(menu: menu)
    }
    func getAllMenu() {
        interactor?.getAllMenu()
    }
}


extension ProfileMenuPresenter:InteractorToPresenterProfileMenuProtocol{
    func sendMenuItem(menuItems: [MenuItem]) {
        view?.sendMenuItem(menuItems: menuItems)
    } 
}
