//
//  Address.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class Address: NSObject {
    var address1:String?
    var label:String?
    var zipCode:String?
    var city:String?
    var state:String?
    var country:String?
    var latitude:String?
    var longitude:String?
    var isObjectValid = false
    
    init(address:[String:AnyObject]) {
        if(address["address1"] == nil && address["label"] == nil && address["zipCode"] == nil && address["city"]  == nil && address["state"] == nil && address["country"] == nil  ){
            isObjectValid = false
            return;
        }
        
        self.address1 = address["address1"] as? String
        self.label = address["label"]  as? String
        self.zipCode = address["zipCode"] as? String
        self.city = address["city"] as? String
        self.state = address["state"] as? String
        self.country = address["country"] as? String
        
        if let gpsLocation = address["gps"] as? [String:AnyObject]{
            self.latitude =  gpsLocation["latitude"] as? String ?? "55.585901"
            self.longitude = gpsLocation["longitude"] as? String ?? "-105.750596"
        }
        
        isObjectValid = true
        
       
    }
    
    
}
