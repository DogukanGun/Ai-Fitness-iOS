//
//  ProfileMenuInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation
import Alamofire


class ProfileMenuInteractor:PresenterToInteractorProfileMenuProtocol{
    
    var presenter: InteractorToPresenterProfileMenuProtocol?
    
    func getProfile(){
        let username = UserDefaults.standard.value(forKey: UserDefaultsKey.USERNAME.rawValue) as! String
        let profileRequest = Profile(username: username, email: "", phoneNumber: "")
        
        AF.request(NetworkUrl.getProfile, method: .post,parameters: profileRequest.toJson(),encoding: JSONEncoding.default,headers: NetworkUrl.getHeader())
            .responseDecodable(of: ProfileResponse.self){ response in
                do{
                    if let profile = response.value?.data{
                        self.presenter?.sendProfile(profile: profile)
                    }
                }catch{
                    print(error)
                }
        }
    }
    
    func saveProfileImage(profileImage:ProfileImage){
        let username = UserDefaults.standard.value(forKey: UserDefaultsKey.USERNAME.rawValue) as! String
        profileImage.username = username
        AF.request(NetworkUrl.updateProfilePhoto, method: .post,parameters: profileImage.toJson(),encoding: JSONEncoding.default,headers: NetworkUrl.getHeader())
            .responseDecodable(of: ProfileResponseData.self){ response in
                do{
                    if let profile = response.value{
                        self.presenter?.sendProfile(profile: profile)
                    }
                }catch{
                    print(error)
                }
        }
    }
    
    func saveProfile(profile:Profile) {
        let username = UserDefaults.standard.value(forKey: UserDefaultsKey.USERNAME.rawValue) as! String
        profile.username = username
        let profileRequest = profile
        
        AF.request(NetworkUrl.updateProfile, method: .post,parameters: profileRequest.toJson(),encoding: JSONEncoding.default,headers: NetworkUrl.getHeader())
            .responseDecodable(of: ProfileResponse.self){ response in
                do{
                    if let profile = response.value?.data{
                        self.presenter?.sendProfile(profile: profile)
                    }
                }catch{
                    print(error)
                }
        }
    }

}


