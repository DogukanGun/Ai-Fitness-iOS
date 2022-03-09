//
//  UserResponse.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation


class UserResponse:Codable{
    var success:Bool
    
    init(success:Bool){
        self.success = success
    }
}
