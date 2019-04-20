//
//  BusinessHours.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class BusinessHours: NSObject {
    var day:String?
    var openAt:String?
    var closeAt:String?
    
    init(day:String, businessHours:[String:AnyObject]) {
     
        self.day  =  day
        self.openAt  = businessHours["from"] as? String
        self.closeAt  = businessHours["to"] as? String
    }
    
    
}
