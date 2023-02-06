//
//  ViewController.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit

class MyMainTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.selectedIndex = 2
        // Do any additional setup after loading the view.
    }


}

