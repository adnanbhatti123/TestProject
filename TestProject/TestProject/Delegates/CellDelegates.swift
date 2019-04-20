//
//  CellDelegates.swift
//  TestProject
//
//  Created by MAC on 4/20/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

protocol CellDelegates: class {
    
        func sendMessage(indexPath:IndexPath);
        func dialPhoneNumber(indexPath:IndexPath);
        func sendEmail(indexPath:IndexPath);
        func openWebsite(indexPath:IndexPath);
        func openMap(indexPath:IndexPath);
        func openFacebookLink(indexPath:IndexPath);
        func openTwitterLink(indexPath:IndexPath);
        func openYoutubeLink(indexPath:IndexPath);
}
