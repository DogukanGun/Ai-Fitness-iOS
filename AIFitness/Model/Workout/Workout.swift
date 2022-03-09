//
//  SportMovement.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/20/21.
//

import Foundation

class Workout:Codable{
    var id:Int?
    var workoutName:String?
    var workoutDescription:String?
    var workoutRating:Int?
    var workoutImage:String?
    
    init(){}
    
    init(workoutName:String,workoutImage:String){
        self.workoutName = workoutName
        self.workoutImage = workoutImage
    }
}
