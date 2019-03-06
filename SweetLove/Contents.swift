//
//  Contents.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class Contents : UIScrollView {
    
    var mainView: MainView?
    var album: Album?
    var settings: Settings?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpContents() {
        isPagingEnabled = true
        
        let width = frame.size.width
        
        // init album
        album = Album.init(frame: CGRect(x: 0, y: 0, width: width, height: frame.size.height), collectionViewLayout: .init())
        album?.setUpAlbum()
        
        // init mainview
        mainView = MainView.init(frame: CGRect(x: width, y: 0, width: width, height: frame.size.height))
        mainView?.setUpMainView()
        
        // init settings
        settings = Settings.init(frame: CGRect(x: 2 * width, y: 0, width: width, height: frame.size.height))
        settings?.setUpSettings()
        
        contentSize = CGSize(width: 3 * width, height: frame.size.height)
        setContentOffset(CGPoint(x: width, y: 0), animated: false)
        addSubview(album!)
        addSubview(mainView!)
        addSubview(settings!)
    }
    
}
