//
//  Restaurant.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class Resource: NSObject {
    
    var resourceID:String?
    var resourceTitle:String?
    var resourceDescription:String?
    var resourcePhoto:String?
    var resourceCreatedAt:String?
    var contactInfo:ContactInfo?
    var socialInfo:SocialInfo?
    var addresses = [Address]()
    var bizHours = [BusinessHours]()
    init(restraunt:[String:AnyObject]) {
        self.resourceID = restraunt["_id"] as? String
        self.resourceTitle = restraunt["title"] as? String
        self.resourceDescription =  restraunt["description"] as? String
        self.resourcePhoto =  restraunt["photo"] as? String
        self.resourceCreatedAt =  restraunt["created_at"] as? String
        
        if let socialMedia =  restraunt["socialMedia"] as? [String : AnyObject]{
        self.socialInfo = SocialInfo.init(socialInfo:socialMedia )
        }
        
        if let contactInfo =  restraunt["contactInfo"] as? [String : AnyObject]
        {
        self.contactInfo = ContactInfo.init(contactObject: contactInfo)
        }
        
        if let addressesList = restraunt["addresses"] as? [[String:AnyObject]]{
       
             for obj in addressesList {
               let address =  Address.init(address:obj )
                if(address.isObjectValid){
                addresses.append(address)
                }
               
            }
            
        }
        
        if let businessHours = restraunt["bizHours"] as? [String:AnyObject]{
            if let sunday = businessHours["sunday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Sunday", businessHours: sunday))
            }
            
            if let monday = businessHours["monday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Monday", businessHours: monday))
            }
            
            if let tuesday = businessHours["tuesday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Tuesday", businessHours: tuesday))
            }
            
            if let wednesday = businessHours["wednesday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Wednesday", businessHours: wednesday))
            }
            
            if let thursday = businessHours["thursday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Thursday", businessHours: thursday))
            }
            
            if let friday = businessHours["friday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Friday", businessHours: friday))
            }
            
            if let saturday = businessHours["saturday"] as? [String:AnyObject]{
                bizHours.append(BusinessHours.init(day: "Saturday", businessHours: saturday))
            }
            
        }
     }
    
    
}
