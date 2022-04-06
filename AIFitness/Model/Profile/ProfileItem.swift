//
//  ProfileItem.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 6.04.2022.
//

import Foundation

class ProfileItem{
    var key:String?
    var value:String?
    
    init(key:String,value:String){
        self.key = key
        self.value = value
    }
}


enum ProfileItemKeys:String{
    case EMAIL = "email"
    case PHONENUMBER = "phoneNumber"
    case IMAGE = "image"
}
