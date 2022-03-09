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
                    self.presenter?.response(response: response.value ?? UserResponse(success: false))
                }catch{
                    print(error)
                }
        }
    }
    
    func login(loginRequest: LoginRequest) {
        AF.request(NetworkUrl.loginUser, method: .post, parameters: loginRequest.toJson(),encoding: JSONEncoding.default)
            .responseDecodable(of: UserResponse.self) { response in
                do{
                    self.presenter?.response(response: response.value ?? UserResponse(success: false))
                }catch{
                    print(error)
                }
            }

    }
}
