//
//  IntroducePageVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/12/21.
//

import Foundation
import UIKit


struct IntroducePageVariables{
    static let loginPressed="Login"
    static let registerPressed="Register"
    static let userFormIdetifier="UserFormVC"

}
class IntroducePageVC:UIViewController{
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: IntroducePageVariables.userFormIdetifier, sender: IntroducePageVariables.loginPressed)
    }
    @IBAction func registerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: IntroducePageVariables.userFormIdetifier, sender: IntroducePageVariables.registerPressed)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == IntroducePageVariables.userFormIdetifier{
            let status = sender as? String
            let destinationVC = segue.destination as! UserFormVC
            if status == IntroducePageVariables.loginPressed{
                destinationVC.formFields = [UserForm.USERNAME,UserForm.PASSWORD]
                destinationVC.buttonText = IntroducePageVariables.loginPressed
            }else if status == IntroducePageVariables.registerPressed{
                destinationVC.formFields = [UserForm.USERNAME,UserForm.PASSWORD,UserForm.NAME,UserForm.SURNAME,UserForm.BIRTHDAY]
                destinationVC.buttonText = IntroducePageVariables.registerPressed

            }
        }
    }
}
