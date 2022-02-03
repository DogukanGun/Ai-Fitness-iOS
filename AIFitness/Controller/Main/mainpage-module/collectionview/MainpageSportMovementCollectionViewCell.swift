//
//  MainpageSportMovementCollectionViewCell.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/20/21.
//

import UIKit

class MainpageSportMovementCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func refresh(sportMovement:Workout){
        if let imageBase64Form = sportMovement.imageBase64Form, let title = sportMovement.title, let imageData = Data(base64Encoded: imageBase64Form, options: Data.Base64DecodingOptions.ignoreUnknownCharacters){
            cellImage.image = UIImage(named:"TestImage")?.withRoundedCorners(radius: CGFloat(40))
            cellImage.layer.masksToBounds = true
            cellLabel.text = title
        }
        
    }

}
