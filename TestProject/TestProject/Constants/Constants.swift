//
//  Constants.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class Constants: NSObject {
    static let apiLink = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/"
    static let kCategoryCell = "categoryCell"
    static let kResourceCell = "resourceCell"
    static let kImageCell = "ImageCell"
    static let kResourceInfoCell = "ResourceInfoCell"
    static let kContactCell = "ContactCell"
    static let kSocialCell = "SocialCell"
    static let kBusinessHoursCell = "BusinessHoursCell"
    
    
    static let kResourcesListVC = "ResourceListVC"
    static let kResourceDetailVC = "ResourceDetailVC"
    
    static let kTotalSections = 6
}

enum ApiNames:String {
    case categories = "categories.json",
     restaurants = "restaurants.json",
     vocationSpot = "vacation-spot.json"
}

enum sectionIndex:Int {
    case photoCell = 0,
    resourceDescriptionCell ,
    contactDetailCell,
    addressCell,
    socialMediaCell,
    openingHoursCell
    
}


enum sectionHeaderTitle:String {
    case photoSectionTitle = "",
    descriptionSectionTitle = "COMPANY INFO",
    contactDetailSectionTitle = "CONTACT INFORMATION",
    addressSectionTitle = "ADDRESS",
    socialMediaSectionTitle = "SOCIAL INFORMATION",
    openingHoursSectionTitle = "BUSINESS HOURS"
    
}


enum contactInfo:String {
    case email = "email",
    website = "website",
    phoneNumber = "phoneNumber",
    tollFree = "tollFree",
    faxNumber = "faxNumber"
}
