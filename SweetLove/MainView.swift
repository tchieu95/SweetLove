//
//  Days.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class MainView : UIView {
    
    var circle: UIImageView?
    var heart: UIImageView?
    
    var leftAvt: UIImageView?
    var leftName: UILabel?
    
    var rightAvt: UIImageView?
    var rightName: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCountDaysView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpCountDaysView() {
        let circleWidth = frame.size.width - 120;
        circle = UIImageView.init(frame: CGRect(x: 60, y: 0, width: circleWidth, height: circleWidth))
        circle?.image = UIImage(named: "cirle.png")
        
        self.addSubview(circle!)
    }
}
