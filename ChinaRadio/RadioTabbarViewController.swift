//
//  RadioTabbarViewController.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/13.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit

class RadioTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        
        addChildViewControllers()

        // Do any additional setup after loading the view.
    }

    func addChildViewControllers(){
        addChildViewController("HomeViewController", title: "首页", imageName: "CD")
        addChildViewController("HomeViewController", title: "发现", imageName: "CD")
        addChildViewController("HomeViewController", title: "下载", imageName: "CD")
        addChildViewController("HomeViewController", title: "我的", imageName: "CD")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func addChildViewController(childControllerName: String,title:String,imageName:String) {
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass = NSClassFromString(ns + "." + childControllerName)!
        let vc = (cls as! UIViewController.Type).init()
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.title = title
        
        let nav = RadioNavigation(rootViewController: vc)
        addChildViewController(nav)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
