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
    
    func saveProfileImage(profileImage: ProfileImage) {
        interactor?.saveProfileImage(profileImage: profileImage)
    }
    func getProfile() {
        interactor?.getProfile()
    }
    func saveProfile(profile:Profile) {
        interactor?.saveProfile(profile: profile)
    }
     
}


extension ProfileMenuPresenter:InteractorToPresenterProfileMenuProtocol{
    func sendProfile(profile: ProfileResponseData) {
        view?.sendProfile(profile: profile)
    }
     
}
