//
//  Days.swift
//  SweetLove
//
//  Created by hieutc2 on 10/1/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class MainView : UIView {
    let avtWidth: CGFloat = 100.0
    let avtHoriPadding: CGFloat = 30.0
    let botPadding: CGFloat = 100.0
    let circleHoriPadding: CGFloat = 70
    
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
        setUpNames()
    }
    
    func setUpCountDaysView() {
        let circleWidth: CGFloat = frame.size.width - 2.0 * circleHoriPadding;
        
        circle = UIView.init(frame: CGRect(x: circleHoriPadding, y: 0, width: circleWidth, height: circleWidth))
        circle?.layer.borderColor = UIColor.green.cgColor
        circle?.layer.cornerRadius = circleWidth / 2.0
        circle?.layer.borderWidth = 5
        
        addSubview(circle!)
    }
    
    func setUpAvts() {
        let width = frame.size.width
        let height = frame.size.height
        let avtYPos: CGFloat = height - botPadding - avtWidth
        
        leftAvt = UIImageView.init(frame: CGRect(x: avtHoriPadding, y: avtYPos, width: avtWidth, height: avtWidth))
        leftAvt?.image = UIImage.init(named: "Man.png")
        addSubview(leftAvt!)
        
        rightAvt = UIImageView.init(frame: CGRect(x: (width - avtWidth - avtHoriPadding), y: avtYPos, width: avtWidth, height: avtWidth))
        rightAvt?.image = UIImage.init(named: "Woman.png")
        addSubview(rightAvt!)
    }
    
    func setUpNames() {
        let topAvtPadding: CGFloat = 10.0
        let labelWidth: CGFloat = 2 * avtHoriPadding + avtWidth
        let labelYPos = frame.size.height - botPadding + topAvtPadding;
        leftName = UILabel.init(frame: CGRect(x: 0, y: labelYPos, width: labelWidth, height: 20))
        leftName?.text = "Bơ-man"
        leftName?.textAlignment = .center
        leftName?.textColor = UIColor.white
        addSubview(leftName!)
        
        rightName = UILabel.init(frame: CGRect(x: rightAvt!.frame.minX - avtHoriPadding, y: labelYPos, width: labelWidth, height: 20))
        rightName?.text = "Gấu xù"
        rightName?.textAlignment = .center
        rightName?.textColor = UIColor.white
        addSubview(rightName!)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
}
