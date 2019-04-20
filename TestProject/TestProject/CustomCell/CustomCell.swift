//
//  CustomCell.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import SDWebImage


class CustomCell: UITableViewCell {
     @IBOutlet weak var titleLable:UILabel!
     @IBOutlet weak var  resourceDescription:UILabel!
     @IBOutlet weak var imageVw:UIImageView!
     @IBOutlet weak var contactLabel:UILabel!
     @IBOutlet weak var contactDescription:UILabel!
    
    @IBOutlet weak var messageBtn:UIButton!
    @IBOutlet weak var phoneBtn:UIButton!
    @IBOutlet weak var emailButton:UIButton!
    @IBOutlet weak var websiteButton :UIButton!
    @IBOutlet weak var mapButton:UIButton!
    
    @IBOutlet weak var facebookButton:UIButton!
    @IBOutlet weak var twitterButton :UIButton!
    @IBOutlet weak var youtubeButton:UIButton!
    @IBOutlet weak var businessDay:UILabel!
    @IBOutlet weak var businessTime:UILabel!
    weak var delegate:CellDelegates?
    
    var _indexPath:IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayCategryInfo(catInfo:Category){
        
        titleLable.text = CategoryViewModel.init(catObject: catInfo).getCategoryTitle()
    }
    
    func displayResourceInfo(resourceInfo:Resource){
    titleLable.text = ResourceViewModel.init(resourceObj: resourceInfo).getResourceTitle()
    imageVw.sd_setImage(with: URL.init(string: ResourceViewModel.init(resourceObj: resourceInfo).getResourcePhoto()))
    }
    
    func displayResourceDetail(indexPath:IndexPath, resourceVM:ResourceViewModel){
       _indexPath = indexPath
        switch indexPath.section {
        case sectionIndex.photoCell.rawValue:
             imageVw.sd_setImage(with: URL.init(string:  resourceVM.getResourcePhoto()))
            break
            
        case sectionIndex.resourceDescriptionCell.rawValue:
             titleLable.text = resourceVM.getResourceTitle()
             resourceDescription.text = resourceVM.getResourceDescription()
            break
            
        case sectionIndex.contactDetailCell.rawValue:
            self.showHideButtons(title: resourceVM.resourceObj.contactInfo!.contactTitleList[indexPath.row])
            contactLabel.text = self.getTitle(title: resourceVM.resourceObj.contactInfo!.contactTitleList[indexPath.row])
            contactDescription.text = resourceVM.getFormattedNumber(title: resourceVM.resourceObj.contactInfo!.contactTitleList[indexPath.row], contact: resourceVM.resourceObj.contactInfo!.contactInfoList[indexPath.row])
            break
            
        case sectionIndex.addressCell.rawValue:
            self.showHideButtons(title: "map")
            contactLabel.text = self.getTitle(title: "map")
            contactDescription.text = resourceVM.getAddress(row: indexPath.row)
            
            break
            
        case sectionIndex.socialMediaCell.rawValue:
       
            break
            
        case sectionIndex.openingHoursCell.rawValue:
              businessDay.text =  resourceVM.getbusinessDay(row: indexPath.row)
              businessTime.text = resourceVM.getOpenCloseHours(row: indexPath.row)
            break
            
        default:
            
            break
        }
        
    }
    
    @IBAction func actionButtonClicked(sender:UIButton){
        
        if (sender == phoneBtn) {
          delegate?.dialPhoneNumber(indexPath: _indexPath)
        }
            
      else if (sender == messageBtn) {
             delegate?.sendMessage(indexPath: _indexPath)
      }
        
      else if (sender == emailButton) {
             delegate?.sendEmail(indexPath: _indexPath)
      }
        
      else if (sender ==  websiteButton) {
             delegate?.openWebsite(indexPath: _indexPath)
        }
        
    else if (sender ==  mapButton) {
             delegate?.openMap(indexPath: _indexPath)
    }
 }
    
    @IBAction func socialActionButtonClicked(sender:UIButton){
        if (sender == facebookButton) {
            delegate?.openFacebookLink(indexPath: _indexPath)
        }
            
        else if (sender == twitterButton) {
            delegate?.openTwitterLink(indexPath: _indexPath)
        }
            
        else if (sender == youtubeButton) {
            delegate?.openYoutubeLink(indexPath: _indexPath)
        }
            
        
        
    }
    
   
}
