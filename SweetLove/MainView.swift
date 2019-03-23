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
    
    var circle: UIView?
    var heart: UIImageView?
    
    var leftAvt: UIButton?
    var leftName: UILabel?
    
    var rightAvt: UIButton?
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
        let circleWidth: CGFloat = frame.size.width - 2.0 * PaddingHelper.leftCirclePadding;
        
        circle = UIView.init(frame: CGRect(x: PaddingHelper.leftCirclePadding, y: 0, width: circleWidth, height: circleWidth))
        circle?.layer.borderColor = UIColor.green.cgColor
        circle?.layer.cornerRadius = circleWidth / 2.0
        circle?.layer.borderWidth = 5
        
        addSubview(circle!)
    }
    
    func setUpAvts() {
        let width = frame.size.width
        let height = frame.size.height
        let avtYPos: CGFloat = height - PaddingHelper.botPadding - avtWidth
        
        leftAvt = UIButton.init(frame: CGRect(x: PaddingHelper.leftAvtPadding, y: avtYPos, width: avtWidth, height: avtWidth))
        leftAvt?.setImage(UIImage.init(named: "Man.png"), for: .normal)
        leftAvt?.addTarget(self, action: #selector(self.handleLeftAvtTap), for: .touchDown)
        addSubview(leftAvt!)
        
        rightAvt = UIButton.init(frame: CGRect(x: (width - avtWidth - PaddingHelper.leftAvtPadding), y: avtYPos, width: avtWidth, height: avtWidth))
        rightAvt?.setImage(UIImage.init(named: "Woman.png"), for: .normal)
        rightAvt?.addTarget(self, action: #selector(self.handleRightAvtTap), for: .touchDown)
        addSubview(rightAvt!)
    }
    
    func setUpNames() {
        let topAvtPadding: CGFloat = 10.0
        let labelWidth: CGFloat = 2 * PaddingHelper.leftAvtPadding + avtWidth
        let labelYPos = frame.size.height - PaddingHelper.botPadding + topAvtPadding;
        leftName = UILabel.init(frame: CGRect(x: 0, y: labelYPos, width: labelWidth, height: 20))
        leftName?.text = "Bơ-man"
        leftName?.textAlignment = .center
        leftName?.textColor = UIColor.white
        addSubview(leftName!)
        
        rightName = UILabel.init(frame: CGRect(x: rightAvt!.frame.minX - PaddingHelper.leftAvtPadding, y: labelYPos, width: labelWidth, height: 20))
        rightName?.text = "Gấu xù"
        rightName?.textAlignment = .center
        rightName?.textColor = UIColor.white
        addSubview(rightName!)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    
    @objc func handleLeftAvtTap() {
        showAvatarActionSheet()
    }
    
    
    @objc func handleRightAvtTap() {
        showAvatarActionSheet()
    }
    
    func showAvatarActionSheet() {
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Change avatar", style: .default , handler:{ (UIAlertAction) in
            print("User click Change avatar button")
        }))
        
        alert.addAction(UIAlertAction(title: "Change name", style: .default , handler:{ (UIAlertAction) in
            print("User click Change Name button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
            print("User click Cancel button")
        }))
        
        Utils.presentViewController(viewController: alert, animated: true)
    }
}
