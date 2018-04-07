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
    var backgroundImgv: UIImageView = UIImageView();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBackgroundImage()
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
    
}

