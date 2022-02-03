//
//  ProfileMenuTableViewCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 1/2/22.
//

import UIKit

class ProfileMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refresh(menu:MenuItem){
        if let imageName = menu.menuImageName, let image = UIImage(named: imageName){
            cellImage.image = image
        }
        if let cellName = menu.menuName{
            cellLabel.text = cellName
        }
        
    }
    
}
