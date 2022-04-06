//
//  Profile.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 9.03.2022.
//

import Foundation


class ProfileResponse:Codable{
    var data:ProfileResponseData?
    var success:Bool?
    
    init(data:ProfileResponseData,success:Bool){
        self.data = data
        self.success = success
    }
}

class ProfileResponseData:Codable{
    var id: Int?
    var name:String?
    var username:String?
    var userType:String?
    var email:String?
    var phoneNumber:String?
    var userPhoto:String?
}

class ProfileImage:Codable{
    var username:String?
    var userPhoto:String?
    
    init(username:String,userPhoto:String){
        self.username = username
        self.userPhoto = userPhoto
    }
    
    func toJson()->[String:Any]{
        return [
            "username":username,
            "userPhoto":userPhoto
        ]
    }
}

class Profile:Codable{
    var username:String?
    var email:String?
    var phoneNumber:String?
    
    init(username:String,email:String,phoneNumber:String){
        self.username = username
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    
    func toJson()->[String:Any]{
        return [
            "username":username,
            "email":email,
            "phoneNumber":phoneNumber
        ]
    }
}
