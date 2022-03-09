//
//  LoginRequest.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation

class LoginRequest:Codable{
    var username:String
    var password:String
    
    init(username:String,password:String){
        self.username = username
        self.password = password
    }
    
    func toJson()->[String:Any]{
        return[
            "username":username,
            "password":password
        ]
    }
}
