//
//  RadioNetworkTool.swift
//  ChinaRadio
//
//  Created by irishsky on 16/11/5.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AVFoundation



class RadioNetworkTool: NSObject {

    static let shareNetworkTool = RadioNetworkTool()
    
    
    func loadHomeScrollViewImage(finished:(homeScrollViewContents:[HomeScrollViewContent]) -> ()) {
        let url = "http://www.radio.cn/v2/appservices.php?access_token=fadiqsthydxlczar&action=homepage_recommend&album_recommend_num=2"
        Alamofire
            .request(.GET, url, parameters: nil)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    print("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == 000 else {
                        print(message + " " + "XxXxX")
                        return
                    }
                    if let contents = dict["contents"].arrayObject{
                        var homeScrollViewContents = [HomeScrollViewContent]()
                        for content in contents{
                            let homeScrollViewContent = HomeScrollViewContent(fromDictionary: content as! [String:AnyObject])
                            homeScrollViewContents.append(homeScrollViewContent)
                        }
                        finished(homeScrollViewContents:homeScrollViewContents)

      
                }
            }
        }
    }
    
    ////
    
    func loadHomeScrollViewChannel(finished:(HomeChannels:[HomeChannel]) -> ()) {
        let url = "http://bk2.radio.cn/mms4/videoPlayInterface/mobileGetChannels.jspa?area=-1&type=-1&start=0&limit=20&terminalType=iPhone&token=fadiqsthydxlczar"
        Alamofire
            .request(.GET, url, parameters: nil)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    print("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == 000 else {
                        print(message + " " + "XxXxX")
                        return
                    }
                    if let contents = dict["channels"].arrayObject{
                        var homeContents = [HomeChannel]()
                        for content in contents{
                            let content = HomeChannel(fromDictionary: content as! [String:AnyObject])
                            homeContents.append(content)
                        }
                        finished(HomeChannels:homeContents)
                        
                        
                    }
                }
        }
    }

    ////
    
    func loadListenBookDetails(type:String,finished:(ListenBookDetails:[ListenBookDetail]) -> ()) {
      
        var url = ""
        if type == "ListenBook"{
        url = "http://www.radio.cn/v2/appservices.php?access_token=fadiqsthydxlczar&action=listenBookRecommend"
        }
        else{
        url = "http://www.radio.cn/v2/appservices.php?access_token=fadiqsthydxlczar&action=henanYujuRecommend"
        
        }
        Alamofire
            .request(.GET, url, parameters: nil)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    print("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == 000 else {
                        print(message + " " + "XxXxX")
                        return
                    }
                    if let recomdict = dict["recom"].dictionary{
                        if let detail = recomdict["detail"]?.arrayObject{
                        var listenBookContents = [ListenBookDetail]()
                        for content in detail{
                            let listenBookContent = ListenBookDetail(fromDictionary: content as! [String:AnyObject])
                            listenBookContents.append(listenBookContent)
                        }
                            finished(ListenBookDetails:listenBookContents)
                        }
                    }
                }
        }
    }
    
    
    ////
    
    func loadHomeList(finished:(HomeList:[HomeTableViewList]) -> ()) {
        
        let url = "http://www.radio.cn/v2/appservices.php?access_token=pslmfoqfuxpuatuv&action=podcastpage"
 
        Alamofire
            .request(.GET, url, parameters: nil)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    print("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == 000 else {
                        print(message + " " + "XxXxX")
                        return
                    }
                    if let lists = dict["lists"].arrayObject{
                            var contents = [HomeTableViewList]()
                            for list in lists{
                                let content = HomeTableViewList(fromDictionary: list as! [String:AnyObject])
                                contents.append(content)
                            }
                            finished(HomeList:contents)
                        
                    }
                }
        }
    }

    ////
    
    func loadPlayList(id:Int,finished:(PlayList:[PlayList]) -> ()) {
        
        let url = "http://www.radio.cn/v2/appservices.php?access_token=fadiqsthydxlczar&action=other_content_list&id=\(id)"
        
        Alamofire
            .request(.GET, url, parameters: nil)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    print("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == 000 else {
                        print(message + " " + "XxXxX")
                        return
                    }
                    if let lists = dict["lists"].arrayObject{
                        var contents = [PlayList]()
                        for list in lists{
                            let content = PlayList(fromDictionary: list as! [String:AnyObject])
                            contents.append(content)
                        }
                        finished(PlayList:contents)
                        
                    }
                }
        }
    }

    
    
    ////
    
    func loadPlayListTop(id:Int,finished:(PlayListTopContent:PlayListTopContent) -> ()) {
        
        let url = "http://www.radio.cn/v2/appservices.php?access_token=fadiqsthydxlczar&action=content_detail&id=\(id)"
        
        Alamofire
            .request(.GET, url, parameters: nil)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    print("加载失败...")
                    return
                }
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == 000 else {
                        print(message + " " + "XxXxX")
                        return
                    }
                    if let list = dict["content"].dictionaryObject{
                        
                            let content = PlayListTopContent(fromDictionary: list )
                            finished(PlayListTopContent:content)
                        
                    }
                }
        }
    }

    
    ////
    
    
    
    
    func test () {

    
    
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
