//
//  ProfileMenuTableViewCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import UIKit

class ProfileMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellValue: UITextField!
    @IBOutlet weak var cellLabel: UILabel!
    var delegate:ProfileMenuTableViewCellProfileItemDelegate? = nil
    var profileItem:ProfileItem? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        cellValue.addTarget(self, action: #selector(valueChange(_:)), for: .editingChanged)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.addGestureRecognizer(tap)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) 
    }
    
    @IBAction func valueChange(_ sender: UITextField) {
        if let text = sender.text, let profile = profileItem{
            profile.value = text
            delegate?.profileItemChanged(profileItem:profile)
        }
    }
    
    @objc func hideKeyboard(){
        self.endEditing(true)
    }
    
    func refresh(profile:ProfileItem){
        if let cellName = profile.key{
            cellLabel.text = cellName
        }
        if let menuValue = profile.value{
            cellValue.attributedPlaceholder = NSAttributedString(
                string: menuValue,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
        }
        self.profileItem = profile
    }
    
}
 
protocol ProfileMenuTableViewCellProfileItemDelegate{
    func profileItemChanged(profileItem:ProfileItem)
}

