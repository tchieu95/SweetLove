//
//  Days.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class MainView : UIView {
    
    var circle: UIView?
    var heart: UIImageView?
    
    var leftAvt: UIImageView?
    var leftName: UILabel?
    
    var rightAvt: UIImageView?
    var rightName: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUpMainView() {
        setUpCountDaysView()
        setUpAvts()
    }
    
    func setUpCountDaysView() {
        let circleWidth: CGFloat = frame.size.width - 140.0
        
        circle = UIView.init(frame: CGRect(x: 60, y: 0, width: circleWidth, height: circleWidth))
        circle?.layer.borderColor = UIColor.green.cgColor
        circle?.layer.cornerRadius = circleWidth / 2.0
        circle?.layer.borderWidth = 5
        
        addSubview(circle!)
    }
    
    func setUpAvts() {
        let width = frame.size.width
        let height = frame.size.height
        let avtWidth: CGFloat = 60.0
        let yAvt: CGFloat = height - 160.0
        let horiPadding: CGFloat = 30.0
        
        rightAvt = UIImageView.init(frame: CGRect(x: horiPadding, y: yAvt, width: avtWidth, height: avtWidth))
        rightAvt?.image = UIImage.init(named: "Man.png")
        addSubview(rightAvt!)
        
        
        leftAvt = UIImageView.init(frame: CGRect(x: (width - avtWidth - horiPadding), y: yAvt, width: avtWidth, height: avtWidth))
        leftAvt?.image = UIImage.init(named: "Woman.png")
        addSubview(leftAvt!)
    }
}
