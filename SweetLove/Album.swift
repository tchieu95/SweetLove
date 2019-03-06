//
//  Album.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class Album : UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpAlbum() {
        backgroundColor = UIColor.green
    }
}
