//
//  UserResponse.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation


class UserResponse:Codable{
    var success:Bool
    var data:UserResponseData?
    init(success:Bool){
        self.success = success
    }
}
