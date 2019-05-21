//
//  VCExtension+TableViewDelegate.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

extension CategoryVC: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let categoryObj = self.categoryVM.catList[indexPath.row]
       moveToResourcesList(resourceVM: ResourceViewModel.init(dataService: DataService(), categoryVM: CategoryViewModel.init(catObject: categoryObj)))
    }
    
}


extension ResourceListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resourceObj = self.resourceVM.resourceList[indexPath.row]
       moveToResourceDetailVC(resourceVMObj: ResourceViewModel.init(resourceObj: resourceObj))
    }
    
}


extension ResourceDetailVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        var sectionName: String = ""
        if (sectionIndex.photoCell.rawValue == section) {
            sectionName = "";
        }
        if (sectionIndex.resourceDescriptionCell.rawValue == section) {
             sectionName = NSLocalizedString(sectionHeaderTitle.descriptionSectionTitle.rawValue, comment: "");
        }
        
        if (sectionIndex.contactDetailCell.rawValue == section && (resourceVMObj.getContactInfo()?.contactInfoList.count)! > 0) {
            sectionName = NSLocalizedString(sectionHeaderTitle.contactDetailSectionTitle.rawValue, comment: "");
        }
        
       
        if (sectionIndex.addressCell.rawValue == section && resourceVMObj.getAddressList().count  > 0) {
            sectionName = NSLocalizedString(sectionHeaderTitle.addressSectionTitle.rawValue, comment: "");
        }
        
    if (sectionIndex.socialMediaCell.rawValue == section) {
            sectionName = NSLocalizedString(sectionHeaderTitle.socialMediaSectionTitle.rawValue, comment: "")
        }
        
        if (sectionIndex.openingHoursCell.rawValue == section && resourceVMObj.getBusinessHours().count  > 0) {
            sectionName = NSLocalizedString(sectionHeaderTitle.openingHoursSectionTitle.rawValue, comment: "")
        }
        
        return sectionName
    }
}
