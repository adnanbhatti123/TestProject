//
//  ViewController.swift
//  TestProject
//
//  Created by MAC on 4/19/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import MapKit
import MBProgressHUD

class CategoryVC: UIViewController {
   @IBOutlet weak var tableView:UITableView!
    var categoryVM = CategoryViewModel.init(dataService: DataService())
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getCategoryViewModel()
       
    }
    
    func getCategoryViewModel(){
       MBProgressHUD.showAdded(to: self.view, animated: true)
       categoryVM.fetchCategoryList { (success) in
        self.tableView.reloadData()
        MBProgressHUD.hide(for: self.view, animated: true)
        }
        
    }
    
    
    
    func moveToResourcesList(resourceVM:ResourceViewModel){
        let resourceListVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.kResourcesListVC) as! ResourceListVC
        resourceListVC.resourceVM = resourceVM
        self.navigationController?.pushViewController(resourceListVC, animated: true)
        
    }
  

}

