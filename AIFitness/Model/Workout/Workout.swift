//
//  SportMovement.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/20/21.
//

import Foundation

class Workout{
    var title:String?
    var imageBase64Form:String?
    
    init(){}
    
    init(title:String,imageBase64Form:String){
        self.title = title
        self.imageBase64Form = imageBase64Form
    }
}
