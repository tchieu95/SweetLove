//
//  Album.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class Memorys : UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var addMemoryBtn: UIButton?
    var albums: AlbumCollectionView?
    var albumsLayout: UICollectionViewFlowLayout?
    var memorys: Array<Any>?
    let iconAddWidth: CGFloat = 60
    
    private let spacingPadding: CGFloat = 20.0
    private var albumWidth: CGFloat = 0.0
    
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
        
        albumWidth = frame.size.width - 2 * PaddingHelper.leftAlbumsPadding
        albumsLayout = UICollectionViewFlowLayout.init()
        
        albums = AlbumCollectionView.init(frame: CGRect(x: PaddingHelper.leftAlbumsPadding, y: spacingPadding, width: albumWidth, height: addMemoryBtn!.frame.minY - 2 * spacingPadding), collectionViewLayout: albumsLayout!)
        albums?.setUpAlbum()
        albums?.delegate = self
        albums?.dataSource = self
        addSubview(albums!)
    }
    
    func loadDB(completion: (NSArray?) -> Void) {
        completion(nil)
    }
    
    @objc func addMemoryTap() {
        let addMemVC = AddMemoryViewController.init()
        Utils.presentViewController(viewController: addMemVC, animated: true)
    }
}

extension Memorys {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = memorys?.count {
            return count
        }
        
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.albumCollectionViewCellIdentifier, for: indexPath) as! AlbumCollectionViewCell
        
        cell.content?.text = "Test cell 1"
        cell.content?.textColor = UIColor.red
        cell.content?.isHidden = false
        
        cell.photo?.image = UIImage.init(named: "note.png")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: albumWidth, height: 150)
    }
    
}

class MemoryModel : NSObject {
    var date: String?
    var memoryId: String?
    var content: String?
    var imagePath: String?
    
    init(content: String, date: Date, imagePath: String) {
        super.init()
        self.date = date.toString(dateFormat: "")
        self.memoryId = "1"
        self.content = content
        self.imagePath = imagePath
    }
    
    func getPhoto() -> UIImage? {
        return nil
    }
    
}
