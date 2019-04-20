//
//  UILabel_Extentions.swift
//  TestProject
//
//  Created by MAC on 4/20/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

extension CustomCell {
    
  func showHideButtons(title:String){
        if (title == "email") {
            self.emailButton.isHidden = false
            self.messageBtn.isHidden = true
            self.phoneBtn.isHidden = true
            self.mapButton.isHidden = true
            self.websiteButton.isHidden = true
        }
        
       else if (title == "website") {
            self.emailButton.isHidden = true
            self.messageBtn.isHidden = true
            self.phoneBtn.isHidden = true
            self.mapButton.isHidden = true
            self.websiteButton.isHidden = false
        }
        
     else if (title == "phoneNumber" ||  title == "tollFree") {
            self.emailButton.isHidden = true
            self.messageBtn.isHidden = false
            self.phoneBtn.isHidden = false
            self.mapButton.isHidden = true
            self.websiteButton.isHidden = true
        }
        
     else if (title == "faxNumber" ) {
            self.emailButton.isHidden = true
            self.messageBtn.isHidden = true
            self.phoneBtn.isHidden = true
            self.mapButton.isHidden = true
            self.websiteButton.isHidden = true
        }
        else{
            
            self.emailButton.isHidden = true
            self.messageBtn.isHidden = true
            self.phoneBtn.isHidden = true
            self.mapButton.isHidden = false
            self.websiteButton.isHidden = true
        }
        
    }
    
    
    func getTitle(title:String) -> String{
        if (title == "email") {
           return "EMAIL ADDRESS"
        }
            
        else if (title == "website") {
          return "WEBSITE"
        }
            
        else  if (title == "phoneNumber") {
          return "PHONE NUMBER"
        }
            
        else   if (  title == "tollFree") {
           return "TOLL-FREE NUMBER"
        }
            
        else   if (title == "faxNumber" ) {
            return "FAX NUMBER"
        }
        else{
            
           return "ADDRESS"
        }
        
    }
    
}
