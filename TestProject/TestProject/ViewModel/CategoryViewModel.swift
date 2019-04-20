//
//  CategoryViewModel.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import Alamofire
class CategoryViewModel: NSObject {
    var catObject:Category!
    var catList = [Category]()
    var dataService:DataService!
    typealias SuccessBlock = (Bool?) -> Void
    
    
    init(dataService:DataService) {
        self.dataService = dataService
    }
    
    init(catObject:Category) {
        self.catObject = catObject
    }
    
    
    
    
    func fetchCategoryList(success:@escaping SuccessBlock)  {
        self.dataService.fetchData(with:ApiNames.categories.rawValue) { (response, error) in
            if(response != nil && response!.count > 0)
            {
                for obj in response!
                {
                  self.catList.append(Category.init(category: obj))
                }
                success(true)
             
           }
        }
    }
    
    
    func getCategoryTitle() -> String{
        
        return catObject.catTitle!;
    }
}
