//
//  TopBarView.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class TopBarView : UIView {
    var albumButton: UIButton = UIButton()
    var nameLabel: UILabel = UILabel()
    var settingButton: UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpAlbumButton()
        setUpLabel()
        setUpSettingButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpAlbumButton() {
        albumButton.frame = CGRect(x: 20, y: 0, width: 36, height: frame.size.height)
        albumButton.setImage(UIImage(named: "note.png"), for: .normal)
        
        self.addSubview(albumButton)
    }
    
    func setUpLabel() {
        nameLabel.frame = CGRect(x: 90, y: 0, width: frame.size.width - 180, height: frame.size.height)
        nameLabel.text = "Sweet Love"
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        self.addSubview(nameLabel)
    }
    
    func setUpSettingButton() {
        settingButton.frame = CGRect(x: frame.size.width - 56, y: 0, width: 36, height: frame.size.height)
        settingButton.setImage(UIImage(named: "setting.png"), for: .normal)
        
        self.addSubview(settingButton)
    }
}
