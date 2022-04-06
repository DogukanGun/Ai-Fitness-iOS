//
//  FormCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/12/21.
//

import UIKit

class FormCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    var delegate:UserFormProtocol?
    private var fieldType:UserForm?
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.addTarget(self, action: #selector(valueChange(_:)), for: .editingChanged)

        // Initialization code
    }

    @IBAction func valueChange(_ sender: UITextField) {
        if let text = sender.text{
            delegate?.userFormProtocol(cell: fieldType!, text)
        }
    }
    func refresh(field:UserForm){
        switch field {
            case .PASSWORD:
                textField.textContentType = UITextContentType.password
                textField.isSecureTextEntry = true
            case .NAME,.SURNAME,.USERNAME:
                textField.textContentType = UITextContentType.name
                textField.isSecureTextEntry = false
            case .TELEPHONE:
                textField.textContentType = UITextContentType.telephoneNumber
                textField.isSecureTextEntry = false
            case .EMAIL:
                textField.textContentType = UITextContentType.emailAddress
                textField.isSecureTextEntry = false
        }
        textField.text = ""
        textField.attributedPlaceholder = NSAttributedString(
            string: field.rawValue,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "TabbarColor")]
        ) 
        fieldType = field
        
    }
    
    
}
