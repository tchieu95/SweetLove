//
//  ViewController.swift
//  SweetLove
//
//  Created by Chi-Hieu on 4/3/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: UIs
    var backgroundImgv: UIImageView = UIImageView()
    var topView: TopBarView?
    var contents: Contents?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBackgroundImage()
        setUpTopView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: utils
    func setBackgroundImage() {
        let bgImg = UIImage(named: "loveBG.jpg")
        backgroundImgv.image = bgImg;
        backgroundImgv.frame = self.view.frame;
        self.view.addSubview(backgroundImgv)
    }
    
    func setUpTopView() {
        topView = TopBarView.init(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.size.height + 10, width: UIScreen.main.bounds.size.width, height: 36))
        self.view.addSubview(topView!)
    }
    
    func setUpContents() {
        contents = Contents.init(frame: CGRect(x: 0, y: (topView?.frame.maxY)!, width: self.view.frame.width, height: self.view.frame.height - (topView?.frame.maxY)!))
        
        self.view.addSubview(contents!)
    }
}

