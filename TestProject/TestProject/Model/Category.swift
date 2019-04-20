//
//  Categories.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class Category: NSObject {
    var catID:String?
    var catTitle:String?
    var catDescription:String?
    var catCreatedDate:String?
    var slug:String?
    var resources:[Resource]?
    
    
    init(category:[String:AnyObject]) {
        self.catID = category["_id"] as? String
        self.catTitle = category["title"] as? String
        self.catDescription = category["description"] as? String
        self.catCreatedDate = category["created_at"] as? String
        self.slug = category["slug"] as? String
    }
    
    func setResources(resourceList:[Resource]){
        self.resources = resourceList
    }
    
}
