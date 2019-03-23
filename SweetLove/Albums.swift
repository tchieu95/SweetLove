//
//  Albums.swift
//  SweetLove
//
//  Created by HieuTC on 3/17/19.
//  Copyright © 2019 Chi-Hieu. All rights reserved.
//

import Foundation
import UIKit

class AlbumCollectionView : UICollectionView {
    
    var memorys: NSMutableArray?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpAlbum() {
        self.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.albumCollectionViewCellIdentifier)
        self.backgroundColor = UIColor.clear
    }
}

class AlbumCollectionViewCell: UICollectionViewCell {
    static public let albumCollectionViewCellIdentifier = "AlbumCollectionViewCellIdentifier"
    
    var content: UILabel?
    var photo: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        content = UILabel.init(frame: frame)
        addSubview(content!)
        
        photo = UIImageView.init(frame: frame)
        photo?.image = UIImage.init(named: "note.png")
        addSubview(photo!)
        
        backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
