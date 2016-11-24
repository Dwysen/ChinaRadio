//
//  RadioNavigation.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/13.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit

class RadioNavigation: UINavigationController {

    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0{
        
            viewController.hidesBottomBarWhenPushed = true
            
        }
        super.pushViewController(viewController, animated: true)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
