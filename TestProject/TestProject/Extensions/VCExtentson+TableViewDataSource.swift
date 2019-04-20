//
//  VCExtention+TableViewDataSource.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

extension CategoryVC:UITableViewDataSource{
    
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.categoryVM.catList.count;
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kCategoryCell) as! CustomCell
        let categoryObj = self.categoryVM.catList[indexPath.row]
        cell.displayCategryInfo(catInfo: categoryObj)
        
        
        return cell;
    }
   
}

extension ResourceListVC:UITableViewDataSource{
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.resourceVM.resourceList.count;
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kResourceCell) as! CustomCell
        let categoryObj = self.resourceVM.resourceList[indexPath.row]
        cell.displayResourceInfo(resourceInfo:categoryObj)
        return cell;
}
    
}


extension ResourceDetailVC:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 6
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case sectionIndex.photoCell.rawValue:
            return 1;
        case sectionIndex.resourceDescriptionCell.rawValue:
            return 1;
        case sectionIndex.contactDetailCell.rawValue:
            return resourceVMObj.resourceObj.contactInfo!.contactInfoList.count;
        case sectionIndex.addressCell.rawValue:
            return resourceVMObj.resourceObj.addresses.count;
        case sectionIndex.socialMediaCell.rawValue:
            return 1;
        case sectionIndex.openingHoursCell.rawValue:
            return resourceVMObj.resourceObj.bizHours.count;
        default:
           return  0;
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomCell?
        
        
        
        switch indexPath.section {
        case sectionIndex.photoCell.rawValue:
            cell = (tableView.dequeueReusableCell(withIdentifier: Constants.kImageCell) as! CustomCell)
            break
            
        case sectionIndex.resourceDescriptionCell.rawValue:
            cell = (tableView.dequeueReusableCell(withIdentifier: Constants.kResourceInfoCell) as! CustomCell)
            break
            
        case sectionIndex.contactDetailCell.rawValue:
            cell = (tableView.dequeueReusableCell(withIdentifier: Constants.kContactCell) as! CustomCell)
            break
            
        case sectionIndex.addressCell.rawValue:
            cell = (tableView.dequeueReusableCell(withIdentifier: Constants.kContactCell) as! CustomCell)
            break
            
        case sectionIndex.socialMediaCell.rawValue:
            cell = (tableView.dequeueReusableCell(withIdentifier: Constants.kSocialCell) as! CustomCell)
            break
            
        case sectionIndex.openingHoursCell.rawValue:
            cell = (tableView.dequeueReusableCell(withIdentifier: Constants.kBusinessHoursCell) as! CustomCell)
            break
       
        default:
            cell = CustomCell();
            break
            
        }
        
        cell?.displayResourceDetail(indexPath: indexPath, resourceVM: resourceVMObj)
        cell?.delegate = self
        return cell!;
    }
    
}
