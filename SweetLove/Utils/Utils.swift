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
    
    static func daysBetweenDates(startDate: Date, endDate: Date) -> Int
    {
        let calendar = NSCalendar.current
        
        let date1 = calendar.startOfDay(for: startDate)
        let date2 = calendar.startOfDay(for: endDate)
        
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        
        return components.day!
    }
}
