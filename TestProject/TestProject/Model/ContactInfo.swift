
//
//  ContactDetail.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ContactInfo: NSObject {
    var contactTitleList = [String]()
    var contactInfoList = [String]()
    
    init(contactObject:[String:AnyObject]) {
    
        if let website =  contactObject["website"] as? [String]{
            if !website.isEmpty {
                contactInfoList.append(website[0])
                contactTitleList.append("website")
            }
          
        }
        
        if let email =  contactObject["email"] as? [String]{
            if email[0].isValidEmail(){
                contactInfoList.append(email[0])
                contactTitleList.append("email")
            }
            
          
        }
        
        if let phoneNumber =  contactObject["phoneNumber"] as? [String]{
            if !phoneNumber[0].isEmpty {
                contactInfoList.append(phoneNumber[0])
                contactTitleList.append("phoneNumber")
            }
            
           
        }
        
        if let faxNumber =  contactObject["faxNumber"] as? [String]{
            if !faxNumber[0].isEmpty {
                contactInfoList.append(faxNumber[0])
                contactTitleList.append("faxNumber")
            }
        }
        
        if let tollFree =  contactObject["tollFree"] as? [String]{
            if !tollFree[0].isEmpty {
                contactInfoList.append(tollFree[0])
                contactTitleList.append("tollFree")
            }
            
            
        }
        
        
    }
    
    

}
