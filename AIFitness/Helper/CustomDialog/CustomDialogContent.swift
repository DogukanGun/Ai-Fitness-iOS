//
//  CustomDialogContent.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 9.03.2022.
//

import Foundation


class CustomDialogContent{
    var title:String
    var message:String
    var positiveButtonText:String
    var negativeButtonText:String?
    var buttonDelegate:CustomDialogButtonDelegate
    
    init(title:String,message:String,positiveButtonText:String,negativeButtonText:String?,buttonDelegate:CustomDialogButtonDelegate){
        self.title = title
        self.message = message
        self.positiveButtonText = positiveButtonText
        self.negativeButtonText = negativeButtonText
        self.buttonDelegate = buttonDelegate
    }
}

protocol CustomDialogButtonDelegate{
    func positiveButtonPressed()
    func negativeButtonPressed()
}
