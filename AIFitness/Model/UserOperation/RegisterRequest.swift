//
//  RegisterRequest.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation


class RegisterRequest:Codable{
    var name:String
    var username:String
    var password:String
    var email:String
    
    init(name:String,username:String,password:String,email:String){
        self.name = name
        self.username = username
        self.password = password
        self.email = email
    }
    
    func toJson()->[String:Any]{
        return[
            "name":name,
            "username":username,
            "password":password,
            "email":email
            ]
    }
}
