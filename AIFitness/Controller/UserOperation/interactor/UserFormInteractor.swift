//
//  UserFormInteractor.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation
import Alamofire


class UserFormInteractor:PresenterToInteractorUserOperationProtocol{
    
    var presenter: InteractorToPresenterUserOperationProtocol?
    
    func register(registerRequest: RegisterRequest) {
        AF.request(NetworkUrl.registerUser, method: .post, parameters: registerRequest.toJson(),
                   encoding: JSONEncoding.default)
            .responseDecodable(of: UserResponse.self){ response in
                do{
                    if let response = response.value{
                        if response.success{
                            UserDefaults.standard.set(registerRequest.username, forKey: UserDefaultsKey.USERNAME.rawValue)
                        }
                        self.presenter?.response(response: response)
                    }else{
                        self.presenter?.response(response:UserResponse(success: false))
                    }
                }catch{
                    print(error)
                }
        }
    }
    
    func login(loginRequest: LoginRequest) {
        AF.request(NetworkUrl.loginUser, method: .post, parameters: loginRequest.toJson(),encoding: JSONEncoding.default)
            .responseDecodable(of: UserResponse.self) { response in
                do{
                    if let response = response.value{
                        if response.success{
                            UserDefaults.standard.set(loginRequest.username, forKey: UserDefaultsKey.USERNAME.rawValue)
                            NetworkUrl.token = response.data?.token ?? ""
                            self.presenter?.response(response: response)
                        }
                    }else{
                        self.presenter?.response(response:UserResponse(success: false))
                    }
                }catch{
                    print(error)
                }
            }

    }
}
