//
//  ProfileMenuInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation


class ProfileMenuInteractor:PresenterToInteractorProfileMenuProtocol{
    func getAllMenu() {
        var list = [MenuItem]()
        let item = MenuItem(id: 0, menuName: "Test1", menuImageName: "star")
        list.append(item)
        presenter?.sendMenuItem(menuItems: list)
    }
    
    var presenter: InteractorToPresenterProfileMenuProtocol?
    
    func getSubMenuItem(menu: MenuItem) {
        //get menu
        var list = [MenuItem]()
        let item = MenuItem(id: 0, menuName: "Test1", menuImageName: "star")
        list.append(item)
        //send menu
        presenter?.sendMenuItem(menuItems: list)
    }
}


