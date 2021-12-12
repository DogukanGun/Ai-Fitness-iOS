//
//  FormCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/12/21.
//

import UIKit

class FormCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func refresh(field:UserForm){
        switch field {
            case .PASSWORD:
                textField.textContentType = UITextContentType.password
            case .NAME,.SURNAME,.USERNAME:
                textField.textContentType = UITextContentType.name
            case .TELEPHONE:
                textField.textContentType = UITextContentType.telephoneNumber
            case .BIRTHDAY:
                textField.textContentType = UITextContentType.dateTime
        }
        textField.placeholder = field.rawValue
        
    }
}
