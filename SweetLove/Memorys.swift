//
//  Album.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class Memorys : UIView {
    var addMemoryBtn: UIButton?
    var album: Album?
    let iconAddWidth: CGFloat = 60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpMemorys() {
        addMemoryBtn = UIButton.init(frame: CGRect(x: frame.size.width / 2 - iconAddWidth / 2, y: frame.size.height - PaddingHelper.botPadding, width: iconAddWidth, height: iconAddWidth))
        addMemoryBtn?.setImage(UIImage.init(named: "addMemory.png"), for: .normal)
        addMemoryBtn?.addTarget(self, action: #selector(self.addMemoryTap), for: .touchDown)
        addSubview(addMemoryBtn!)
    }
    
    func loadDB(completion: (NSArray?) -> Void) {
        completion(nil)
    }
    
    @objc func addMemoryTap() {
        let addMemVC = AddMemoryViewController.init()
        Utils.presentViewController(viewController: addMemVC, animated: true)
        
    }
}

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
