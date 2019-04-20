//
//  VCExtention+Delegates.swift
//  TestProject
//
//  Created by MAC on 4/20/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import MessageUI
import MapKit

extension ResourceDetailVC: CellDelegates,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
    
  
    func sendMessage(indexPath:IndexPath)
    {
        let receipientNumber =  self.resourceVMObj.getContactInfo()?.contactInfoList[indexPath.row]
        if (MFMessageComposeViewController.canSendText()) {
            let chatMassenger = MFMessageComposeViewController()
            chatMassenger.body = "Hi"
            chatMassenger.recipients = [receipientNumber] as? [String]
            chatMassenger.messageComposeDelegate = (self as MFMessageComposeViewControllerDelegate)
            self.present(chatMassenger, animated: true, completion: nil)
        }
        
    }
    
    func dialPhoneNumber(indexPath:IndexPath)
   {
    let receipientNumber =  self.resourceVMObj.getContactInfo()!.contactInfoList[indexPath.row]
    if let phoneUrl = URL(string: "tel://\(receipientNumber )") {
        UIApplication.shared.open(phoneUrl, options: [:], completionHandler:nil)
    }
    }
    func sendEmail(indexPath:IndexPath)
   {
    
    let email =  self.resourceVMObj.getContactInfo()!.contactInfoList[indexPath.row]
    if (MFMailComposeViewController.canSendMail()) {
        let emailVC = MFMailComposeViewController()
        emailVC.mailComposeDelegate = self
        emailVC.setToRecipients([email])
        self.present(emailVC, animated: true, completion: nil)
    }
}
    
    func openWebsite(indexPath:IndexPath)
   {
    let websiteLink =  self.resourceVMObj.getContactInfo()!.contactInfoList[indexPath.row]
    let webViewVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewVC") as! WebViewVC
    webViewVC.websiteLink = websiteLink
    self.navigationController?.pushViewController(webViewVC, animated: true)
   }
    
    func openMap(indexPath:IndexPath)
   {
     let address =  self.resourceVMObj.resourceObj.addresses[indexPath.row]
     if (address.latitude != nil && address.longitude != nil) {
        let coordinate = CLLocationCoordinate2DMake(Double(address.latitude!)!, Double(address.longitude!)!)
        let itemObject = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        itemObject.name =  self.resourceVMObj.getAddress(row: indexPath.row)
        itemObject.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
    
    
   }

    
    func openFacebookLink(indexPath:IndexPath)
    {
        if (self.resourceVMObj.getSocialInfo()?.facebookLink != nil) {
            let facebookLink =  self.resourceVMObj.getSocialInfo()!.facebookLink
            guard let url = URL(string: facebookLink ?? "") else { return }
            UIApplication.shared.open(url)
        }
      
    }
    
    func openTwitterLink(indexPath:IndexPath)
    {
        if (self.resourceVMObj.getSocialInfo()?.twitterLink != nil) {
            let twitterLink =  self.resourceVMObj.getSocialInfo()!.twitterLink
            guard let url = URL(string: twitterLink ?? "") else { return }
            UIApplication.shared.open(url)
        }
    }
    
    func openYoutubeLink(indexPath:IndexPath){
        if (self.resourceVMObj.getSocialInfo()?.youtubeLink != nil) {
            let youtubeLink =  self.resourceVMObj.getSocialInfo()!.youtubeLink
            guard let url = URL(string: youtubeLink ?? "") else { return }
            UIApplication.shared.open(url)
        }
   }
}
