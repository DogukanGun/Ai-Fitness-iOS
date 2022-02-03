//
//  CollectionView+setDesign.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 3.02.2022.
//

import Foundation
import UIKit

extension UICollectionView {
    func setDesign(itemPerRow:Int,inset:UIEdgeInsets,spacing:CGFloat,itemSize:CGSize){
        let design = UICollectionViewFlowLayout()
        design.sectionInset = inset
        design.minimumInteritemSpacing = spacing
        design.minimumLineSpacing = spacing
        
        design.itemSize = itemSize
    
        self.collectionViewLayout = design
    }
}
