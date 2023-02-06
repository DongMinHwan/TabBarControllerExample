//
//  PickVC.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit
import Gifu
import SwiftyGif
class PickCasterVC: UIViewController {

    
    @IBOutlet weak var testImage: UIImageView!
    let gifImageView = GIFImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    
    @IBOutlet weak var testImg2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("pickcaster")
     //   loadGif()
//        
//        test2.animate(withGIFNamed: "splash") {
//            print("It's animating!")
//        }
//        
//        testImage = gifImageView
        
    }
    
    
//    func loadGif() {
//        testImg2.delegate = self
//        do{
//            let gif = try UIImage(gifName: "splashes")
//            testImg2.setGifImage(gif, loopCount: 1)
//        }catch {
//
//        }
//    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        super.viewWillAppear(animated)
       //self.navigationController?.navigationBar.isHidden = true
        
    }
    



}
