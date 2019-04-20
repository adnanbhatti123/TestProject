//
//  DataService.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit
import Alamofire

struct DataService {
    
    // MARK: - Singleton
     
    
    // MARK: - URL
   
    // MARK: - Services
    func fetchData(with apiName: String, completion: @escaping ([[String:AnyObject]]?, Error?) -> ()) {
        let url = URL.init(string: "\(Constants.apiLink)\(apiName)")
        
         Alamofire.request(url!).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                if let responseData = responseData.result.value{
                    let responsevalue = responseData  as? [[String:AnyObject]]
                    completion(responsevalue,nil)
                    return;
                    
                }
                
                
            }
            
        }
    }
    
}
