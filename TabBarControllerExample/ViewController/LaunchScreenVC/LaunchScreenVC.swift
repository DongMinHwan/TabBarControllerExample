//
//  LaunchScreenVC.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit
import SwiftyGif



class LaunchScreenVC: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    @IBOutlet var launchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchView.backgroundColor = .red
//        self.loadSplash()
        print("screeen")
//        self.gifImageView.image = UIImage(named: "CheckSelect")
    }
    
    func loadSplash() {
        print("screeen_01")
        gifImageView.delegate = self
        launchView.backgroundColor = .red
        do {
            print("screeen_02")
            let gif = try UIImage(gifName: "splashes")
            gifImageView.setGifImage(gif, loopCount: 5)
        }catch{
            print("error 발생")
        }
    }
}

extension LaunchScreenVC  : SwiftyGifDelegate {
    
    func gifDidLoop(sender: UIImageView) {
        self.goMain()
    }
    
    func goMain() {
        
        // initialize GPS Location
        LocationManager.shared.startUpdatingLocation()
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            
            let main = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
            window.rootViewController = main.instantiateInitialViewController()
        }
    }
    
}
