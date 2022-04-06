//
//  CustomDialogVC.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 9.03.2022.
//

import Foundation
import UIKit

class CustomDialogVC:UIView{
    
    static let instance = CustomDialogVC()
    var customDialogContent:CustomDialogContent?
    private var negativeButtonDisable = false
    @IBOutlet weak var negativeButtonSpaceView: UIView!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var customDialogWrapper: UIView!
    @IBOutlet weak var customDialogTitle: UILabel!
    @IBOutlet weak var customDialogMessage: UILabel!
    @IBOutlet weak var customDialogPositiveButton: UIButton!
    @IBOutlet weak var customDialogNegativeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomDialogView", owner: self, options: nil)
        if let customDialogContent = customDialogContent {
            setCustomDialogContent(_customDialogContent: customDialogContent)
        }
    }
         
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
          
    @IBOutlet weak var bottomWrapper: UIStackView!
    
    private func setCustomDialogContent(_customDialogContent:CustomDialogContent){
        customDialogWrapper.layer.cornerRadius = CGFloat(10)
        bottomWrapper.layer.cornerRadius = CGFloat(10)
        customDialogWrapper.layer.borderWidth = 2
        customDialogWrapper.layer.borderColor = UIColor(named: "TabbarColor")?.cgColor
        customDialogMessage.layer.cornerRadius = CGFloat(30)
        customDialogTitle.layer.cornerRadius = CGFloat(30)
        parentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        customDialogTitle.text = _customDialogContent.title
        customDialogMessage.text = _customDialogContent.message
        customDialogPositiveButton.reshape()
        customDialogPositiveButton.setTitle(_customDialogContent.positiveButtonText, for: .normal)
        if let negativeButtonText = _customDialogContent.negativeButtonText{
            customDialogNegativeButton.reshape()
            customDialogNegativeButton.titleLabel?.text = negativeButtonText
            customDialogNegativeButton.frame.size.height = 50
            customDialogNegativeButton.isEnabled = true
            customDialogNegativeButton.isHidden = false
            negativeButtonSpaceView.isHidden = false
        }else{
            customDialogNegativeButton.isHidden = true
            customDialogNegativeButton.isEnabled = false
            customDialogNegativeButton.frame.size.height = 0
            negativeButtonSpaceView.isHidden = true
            self.layoutIfNeeded()
        }
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.parentClick))
        self.parentView.addGestureRecognizer(gesture)
    }
    
    @objc func parentClick(_ sender:UITapGestureRecognizer){
        //sadece alert dışında kalan kısımda çalışmalı alan kontrolü gerekli
    }
    
    @IBAction func negativeButtonClicked(_ sender: Any) {
        parentView.removeFromSuperview()
        customDialogContent?.buttonDelegate.negativeButtonPressed()
    }
    @IBAction func positiveButtonClicked(_ sender: Any) {
        parentView.removeFromSuperview()
        customDialogContent?.buttonDelegate.positiveButtonPressed()
    }
    
    func showAlert() {
        if let customDialogContent = customDialogContent {
            setCustomDialogContent(_customDialogContent: customDialogContent)
        }
        if let width = UIApplication.shared.keyWindow?.bounds.width, let height = UIApplication.shared.keyWindow?.bounds.height{
            parentView.frame.size.width = width
            parentView.frame.size.height = height
            UIApplication.shared.keyWindow?.addSubview(parentView)
        }
        
    }
    
}
