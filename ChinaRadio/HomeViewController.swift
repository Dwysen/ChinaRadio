//
//  ViewController.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/5.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {

    var currentMaxY:CGFloat?
    
    var lists = [HomeTableViewList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
  
    
    }

    
    func setupUI(){
   
        self.view.backgroundColor = UIColor.grayColor()
        
        RadioNetworkTool.shareNetworkTool.loadHomeScrollViewImage { (homeScrollViewContents) in
            self.topView.homeContents = homeScrollViewContents
        }
        RadioNetworkTool.shareNetworkTool.loadHomeScrollViewChannel { (HomeChannels) in
            self.topView.homeChannels = HomeChannels
        }
        RadioNetworkTool.shareNetworkTool.loadListenBookDetails("ListenBook") {(ListenBookDetails) in
            self.BackScrollView.addSubview(RadioFactioryForHomeCommenView.GeneralCommenView(self,title:"听书", currentY: HomeTopViewHeight + 10,dataArray:ListenBookDetails,type: .listenBook))
        }
        RadioNetworkTool.shareNetworkTool.loadListenBookDetails("HenanYuju") { (ListenBookDetails) in
            let view = RadioFactioryForHomeCommenView.GeneralCommenView(self,title: "河南豫剧专区", currentY: HomeTopViewHeight + 10 + CommenViewHeight + 10,dataArray:ListenBookDetails,type: .listenBook)
            self.BackScrollView.addSubview(view)
            
        }
        RadioNetworkTool.shareNetworkTool.loadHomeList { (HomeList) in
            
            self.lists = HomeList
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.rowHeight = HomeCellHeight
            self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            self.tableView.backgroundColor = UIColor.yellowColor()
            self.tableView.scrollEnabled = false
            self.tableView.separatorStyle = .None
            self.tableView.frame = CGRectMake(0, HomeTopViewHeight + 30  + 2 * CommenViewHeight, SCREENW, 10 * HomeCellHeight)
            self.BackScrollView.addSubview(self.tableView)
            
            
            self.BackScrollView.contentSize = CGSize(width: SCREENW, height: self.tableView.frame.maxY )
        }
        
        self.BackScrollView.addSubview(self.topView)
        self.view.addSubview(BackScrollView)
        
// 主页右上角barItem
//      self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: #selector(ToPlayViewController))

    }
    
    
    func ToPlayViewController(){
        let vc = PlayViewController()
        self.presentViewController(vc, animated: true) { 
            
        }
    
    }

    
    private lazy var BackScrollView:UIScrollView = {
    
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH))
        scrollView.scrollEnabled = true
        return scrollView
    
        
    }()
    
    private lazy var topView:HomeTopView = {
        let topView = HomeTopView(frame: CGRectMake(0, 0, SCREENW, HomeTopViewHeight))
        topView.delegete = self
        topView.backgroundColor = UIColor.whiteColor()
        return topView
    }()
    
    private lazy var tableView:UITableView = {
    
        let tableView = UITableView()
        return tableView
    }()
    
//    private lazy var listenBookSection: = {
//    
//        let listenBookSection 
//        
//    }()
    
    
    func Test(){
        print("More")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension HomeViewController:TopViewDidClickedCollection{
    
    func TopViewDidClickedCollection(id: Int) {
        let vc = PlayListViewController()
        vc.id = id

        self.navigationController?.pushViewController(vc, animated: true)
            
      

        
    }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource {

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let view = RadioFactioryForHomeCommenView.GeneralCommenView(self,title:lists[indexPath.row].name, currentY: 0, dataArray: lists[indexPath.row].detail, type: .homelist)
        cell.addSubview(view)
        cell.backgroundColor = UIColor.grayColor()
        return cell
        
        
    }



}




