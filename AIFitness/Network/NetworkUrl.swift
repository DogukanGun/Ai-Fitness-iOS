//
//  NetworkUrl.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation
import Alamofire


class NetworkUrl{
    private static let baseUrl = "http://aifitness-api.herokuapp.com/"
    static let registerUser = "\(baseUrl)auth/register"
    static let loginUser = "\(baseUrl)auth/login"
    static let getAllWorkouts = "\(baseUrl)workout/workout/all"
    static let getWorkoutsByName = "\(baseUrl)workout/workout/name/"
    static let getProfile = "\(baseUrl)user/getProfile"
    static let updateProfile = "\(baseUrl)user/updateUser"
    static let updateProfilePhoto = "\(baseUrl)user/updatephoto"
    static var token = ""
    
    static func getHeader()->HTTPHeaders{
        let headers:HTTPHeaders = [ "Authorization": token ]
        return headers
    }
}
