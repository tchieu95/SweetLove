//
//  HHUtils.swift
//  SweetLove
//
//  Created by Chi-Hieu on 4/3/18.
//  Copyright © 2018 Chi-Hieu. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func createUImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0) , size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
}
