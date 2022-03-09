//
//  NetworkUrl.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 8.03.2022.
//

import Foundation


class NetworkUrl{
    private static let baseUrl = "https://aifitness-api.azurewebsites.net/"
    static let registerUser = "\(baseUrl)auth/register"
    static let loginUser = "\(baseUrl)auth/login"
    static let getAllWorkouts = "\(baseUrl)workout/workout/all"
    static let getWorkoutsByName = "\(baseUrl)workout/workout/name/"

}
