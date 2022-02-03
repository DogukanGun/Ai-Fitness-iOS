//
//  CollectionView+space.swift
//  AIFitness
//
//  Created by Dogukan Gundogan on 12/20/21.
//

import Foundation
import UIKit

extension UICollectionView{
    func getSpace(width:CGFloat,sectionInsets:UIEdgeInsets,itemsPerRow:CGFloat,height:Int?) -> CGSize{
        let paddingSpace = sectionInsets.left * (itemsPerRow)
        let availableWidth = width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        if let height = height {
            return CGSize(width: widthPerItem, height: (CGFloat(height)/2)+20)
        }else{
            return CGSize(width: widthPerItem, height: 60)
        }
        
    }
}
