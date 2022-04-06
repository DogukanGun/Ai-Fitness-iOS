//
//  UploadWorkoutVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 5.04.2022.
//

import Foundation
import UIKit

class UploadWorkoutVC:UIViewController{
    
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var carouselMessageLabel: UILabel!
    @IBOutlet weak var carouselScrollView: UIScrollView!
    
    override func viewWillAppear(_ animated: Bool) {
        let image = UIImage(named: "TestImage")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height:  self.view.bounds.height))
        imageView.image = image
        carouselScrollView.addSubview(imageView)
        carouselScrollView.addSubview(imageView)
        carouselScrollView.addSubview(imageView)
        uploadButton.reshape()
    }
    
    @IBAction func uploadButtonPressed(_ sender: Any) {
        
    }
    
}
