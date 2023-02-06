//
//  LatestVC.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit

class LatestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
       //self.navigationController?.navigationBar.isHidden = true
        
    }

}
