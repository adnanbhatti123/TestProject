//
//  WebViewVC.swift
//  TestProject
//
//  Created by MAC on 4/20/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit
import WebKit
class WebViewVC: UIViewController {

    @IBOutlet weak var webView:WKWebView!
    var websiteLink:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.load(URLRequest.init(url: URL.init(string: websiteLink)!))
        // Do any additional setup after loading the view.
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
