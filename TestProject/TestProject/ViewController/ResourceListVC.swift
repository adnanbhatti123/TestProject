//
//  ResourceListVC.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import MBProgressHUD

class ResourceListVC: UIViewController {
   
   
    var resourceVM:ResourceViewModel!
   @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
          getResourceVMObject()
         addSortButton()
        // Do any additional setup after loading the view.
        
    }
    
    func addSortButton(){
        let sortButton = UIBarButtonItem.init(title: "Sort", style: .plain, target: self, action: #selector(self.sortResourcesList))
        self.navigationItem.rightBarButtonItem = sortButton;
    }
    
    @objc func sortResourcesList(){
        resourceVM.sortResources()
        self.tableView.reloadData()
    }
    
    func getResourceVMObject(){
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        resourceVM.fetchRestaurantsList { (success) in
            if(success!){
                self.tableView.reloadData()
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        
        }
       
        
    }
    
    func moveToResourceDetailVC(resourceVMObj:ResourceViewModel){
    let resourceDetailVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.kResourceDetailVC) as! ResourceDetailVC
    resourceDetailVC.resourceVMObj = resourceVMObj
    self.navigationController?.pushViewController(resourceDetailVC, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
