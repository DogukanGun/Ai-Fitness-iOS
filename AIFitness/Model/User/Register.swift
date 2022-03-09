//
//  Register.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/27/21.
//
import Foundation

class Register:Codable{
    var username:String = ""
    var password:String = ""
    var name:String = ""
    var surname:String = ""
    var email:String = ""
    var telNumber:String = ""
    
    
    func clear(){
        username = ""
        password = ""
        name = ""
        surname = ""
        email = ""
        telNumber = ""
    }
}
