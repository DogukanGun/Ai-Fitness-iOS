//
//  LoadingView.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 6.04.2022.
//
import Foundation
import UIKit
import Lottie

class LoadingViewVC: UIView {
    
    @IBOutlet var parentView: UIView!
    static let instance = LoadingViewVC()
    private var animationView: AnimationView = .init(name: "loading-spinner")
    @IBOutlet weak var wrapper: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)
        parentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        wrapper.backgroundColor = UIColor(white: 1, alpha: 0.5)
        viewLoad()

    }
         
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       
    
    private func viewLoad() {
        parentView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        wrapper.backgroundColor = UIColor(white: 1, alpha: 0.0)
        animationView.backgroundColor = UIColor(white: 1, alpha: 0.0)
        animationView.frame = wrapper.bounds
        animationView.loopMode = .autoReverse
        animationView.animationSpeed = 0.5
        wrapper.addSubview(animationView)
    }
    
    func showAlert() {
        if let width = UIApplication.shared.keyWindow?.bounds.width, let height = UIApplication.shared.keyWindow?.bounds.height{
            parentView.frame.size.width = width
            parentView.frame.size.height = height
            animationView.play()
            UIApplication.shared.keyWindow?.addSubview(parentView)
        }
    }
    
    func hideView(){
        animationView.stop()
        parentView.removeFromSuperview()
    }

}
