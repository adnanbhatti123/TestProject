//
//  ResourceViewModel.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ResourceViewModel: NSObject {
    
    var isSortASC = true
    var resourceObj:Resource!
    private var categoryVM:CategoryViewModel!
    var resourceList = [Resource]()
    var dataService:DataService!
    typealias SuccessBlock = (Bool?) -> Void
    
    
    init(dataService:DataService, categoryVM:CategoryViewModel) {
        self.dataService = dataService
        self.categoryVM = categoryVM
    }
    
    init(resourceObj:Resource) {
        self.resourceObj = resourceObj
    }
    
    
    func fetchRestaurantsList(success:@escaping SuccessBlock)  {
        
        var apiName = ""
        self.categoryVM.catObject.slug == "restaurants" ? (apiName = ApiNames.restaurants.rawValue) : (apiName = ApiNames.vocationSpot.rawValue)
        
        self.dataService.fetchData(with: apiName) { (response, error) in
            if(response != nil && response!.count > 0)
            {
                for obj in response!
                {
                    self.resourceList.append(Resource.init(restraunt:obj))
                }
                success(true)
                
            }
        }
    }
    
   
    
    
    func getResourceTitle() -> String{
        return resourceObj.resourceTitle!;
    }
    
    func getResourceDescription() -> String{
        return resourceObj.resourceDescription?.replacingOccurrences(of: "<p>", with: "").replacingOccurrences(of: "</p>", with: "") ?? "";
    }
    
    func getResourcePhoto() -> String{
        return resourceObj.resourcePhoto!;
    }
    
    func getCreatedData() -> String{
        return resourceObj.resourceCreatedAt!;
    }
  
    func getSocialInfo() -> SocialInfo?{
         return  resourceObj.socialInfo
    }
    
    func getAddress(row:Int) -> String{
       let address = resourceObj.addresses[row]
        
        if address.address1 == nil && address.label == nil && address.city == nil && address.state == nil && address.country == nil {
            return "Not Given"
        }
        
        return "\(address.address1 ?? ""), \(address.label ?? ""), \(address.city ?? ""), \(address.state ?? ""), \(address.country ?? "") "
    }
    
    func getContactInfo() -> ContactInfo?{
        return resourceObj.contactInfo
    }
    
    func getAddressList() -> [Address]{
        return resourceObj.addresses
    }
    
    func getBusinessHours() -> [BusinessHours]{
        return resourceObj.bizHours
    }
    
    func getFormattedNumber(title:String,contact:String) -> String{
        
        if contact.isEmpty {
            return "Not Given"
        }
        
        if(title == "email" || title == "website"){
            return contact
        }
        return contact.formattedNumber()
        
    }
     
    func getbusinessDay(row:Int) -> String{
      let businessHour =  resourceObj.bizHours[row]
        return businessHour.day ?? ""
    }
    
    func getOpenCloseHours(row:Int) -> String{
        let businessHour =  resourceObj.bizHours[row]
        return "\(businessHour.openAt ?? "") - \(businessHour.closeAt ?? "")"
    }
    
    func sortResources(){
        if isSortASC {
             resourceList =  resourceList.sorted(by: { $0.resourceTitle! < $1.resourceTitle! })
        }else{
            resourceList =  resourceList.sorted(by: { $0.resourceTitle! > $1.resourceTitle! })
        }
        
        isSortASC = !isSortASC;
    }
}
