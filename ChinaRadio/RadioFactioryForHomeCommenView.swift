//
//  RadioFactioryForHomeCommenView.swift
//  ChinaRadio
//
//  Created by irishsky on 16/11/7.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import Kingfisher

enum DataType{
    case listenBook
    case homelist
}



class RadioFactioryForHomeCommenView: NSObject {
    
    static func GeneralCommenView(target:UIViewController,title:String,currentY:CGFloat,dataArray:[AnyObject],type:DataType) -> UIView{
    
        let view = UIView()
        view.backgroundColor = UIColor.whiteColor()
        
        let titleLabel = UILabel(frame: CGRectMake(screenMargin, topMargin, 100,titleHeight))
        titleLabel.text = title
        titleLabel.textColor = UIColor.greenColor()
        titleLabel.font = UIFont.systemFontOfSize(18)
        view.addSubview(titleLabel)
        
        let moreBtn = UIButton(frame: CGRect(x: SCREENW - 60, y: topMargin, width: 50, height: titleHeight))
        moreBtn.setTitle("更多>", forState: .Normal)
        moreBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        moreBtn.titleLabel?.font = UIFont.systemFontOfSize(12)
        moreBtn.titleLabel?.textAlignment = .Right
        moreBtn.addTarget(target, action: #selector(HomeViewController.Test), forControlEvents: .TouchUpInside)
        view.addSubview(moreBtn)
        
        let btnW:CGFloat = (SCREENW - 4 * screenMargin) / 3
        let btnH:CGFloat = btnW + smallTitleLabelHeight + 10
        
        let btnY:CGFloat = topMargin + titleHeight + topMargin
        
     
        for index in 0..<3{
            let btnX = screenMargin + CGFloat(index) * (btnW + screenMargin)
            let btn = HomeButton(frame: CGRect(x: btnX, y: btnY, width: btnW, height: btnH))
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            btn.titleLabel?.numberOfLines = 0
        
            switch type {
            case .listenBook :
                let listenBook = dataArray[index] as! ListenBookDetail
                let url = NSURL(string: listenBook.img)
                btn.kf_setImageWithURL(url!, forState: .Normal)
                btn.setTitle(listenBook.title, forState: .Normal)
                btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            
                break
            default:
                let homelistdetail = dataArray[index] as! HomeTableViewDetail
                let url = NSURL(string: homelistdetail.img)
                btn.kf_setImageWithURL(url!, forState: .Normal)
                btn.setTitle(homelistdetail.title, forState: .Normal)
                btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
                break
            }
            
            view.addSubview(btn)
        }
        
        (frame: CGRectMake(0, currentY, SCREENW,180))
        view.frame = CGRectMake(0, currentY, SCREENW, 20 + titleHeight + btnH)
      
    
        
        
    return view
    }

}
