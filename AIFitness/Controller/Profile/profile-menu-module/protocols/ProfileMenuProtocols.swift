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
    func getProfile()
    func saveProfileImage(profileImage:ProfileImage)
    func saveProfile(profile:Profile)
    
}

protocol ViewToPresenterProfileMenuProtocol{
    var interactor:PresenterToInteractorProfileMenuProtocol? {get set}
    var view:PresenterToViewProfileMenuProtocol? {get set}
    func getProfile()
    func saveProfileImage(profileImage:ProfileImage)
    func saveProfile(profile:Profile)
}

//helper protocol
protocol InteractorToPresenterProfileMenuProtocol{
    func sendProfile(profile:ProfileResponseData)
}

protocol PresenterToViewProfileMenuProtocol{ 
    func sendProfile(profile:ProfileResponseData)
}

//router
protocol PresenterToRouterProfileMenuProtocol{
    static func createModule(ref:ProfileMenuVC)
}
