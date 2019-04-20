//
//  ResourceDetailVC.swift
//  TestProject
//
//  Created by Muhammad Arslan Khalid on 19/04/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class ResourceDetailVC: UIViewController {
   var resourceVMObj:ResourceViewModel!
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
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
