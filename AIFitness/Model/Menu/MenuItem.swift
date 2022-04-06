//
//  MenuItem.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import Foundation

class MenuItem{
    var id:Int?
    var value:String?
    var menuName:String?
    var menuImageName:String?
     
    init(id:Int,menuName:String,menuImageName:String,value:String){
        self.id = id
        self.menuImageName = menuImageName
        self.menuName = menuName
        self.value = value
    }
}
