//
//  SocialNetwork.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class SocialInfo: NSObject {
    var facebookLink:String?
    var twitterLink:String?
    var youtubeLink:String?
    
    init(socialInfo:[String:AnyObject]) {
     
        if let facebookLink = socialInfo["facebook"] as? [String]
        {
            self.facebookLink = facebookLink[0]
        }
        
        if let twitterLink = socialInfo["twitter"] as? [String]
        {
            self.twitterLink = twitterLink[0]
        }
        
        if let youtubeLink = socialInfo["youtubeChannel"] as? [String]
        {
            self.youtubeLink = youtubeLink[0]
        }
        
        
    }
    
}
