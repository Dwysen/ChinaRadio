//
//  PlayListViewController.swift
//  ChinaRadio
//
//  Created by irishsky on 16/11/12.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit

class PlayListViewController: UIViewController {

    
    var id : Int?{
        didSet{
      
        RadioNetworkTool.shareNetworkTool.loadPlayList(id!) { (PlayList) in
           
            self.playList = PlayList
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.view.addSubview(self.tableView)
            }
         
            RadioNetworkTool.shareNetworkTool.loadPlayListTop(id!) { (PlayListTopContent) in
            
                self.title = PlayListTopContent.title
                self.topView.content = PlayListTopContent
                self.view.addSubview(self.topView)
                
            }
        
        }
    }
    
    var playList = [PlayList]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
     

        // Do any additional setup after loading the view.
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private lazy var topView:PlayListTopView = {
    
        let topView = PlayListTopView(frame: CGRect(x: 0, y: 64, width: SCREENW, height: 150))
        return topView
    }()
    
    private lazy var tableView:UITableView = {
    
        let tableView = UITableView(frame: CGRect(x: 0, y: 150 + 64, width: SCREENW, height: SCREENH - 64 - 150))
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    
    
    }()


}

extension PlayListViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = playList[indexPath.row].title
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
 
        RadioNetworkTool.shareNetworkTool.loadPlayListTop(Int(playList[indexPath.row].id)!) { (PlayListTopContent) in
            
            
            
          
            
            let vc = PlayViewController()
            vc.content = PlayListTopContent
            self.presentViewController(vc, animated: true) {
                
            }
            
        }
     
        
    }
    
    
    
    
}
