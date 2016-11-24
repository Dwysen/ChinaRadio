//
//  MusicPlayerManager.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/14.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import AVFoundation

public class MusicPlayerManager: NSObject {
    
     public var player: AVPlayer?
     var isPlaying:Bool!
//     public var playerItem
    
    public class var sharedInstance: MusicPlayerManager {
        struct Singleton {
            static let instance = MusicPlayerManager()
        }
        //  后台播放
//        let session = AVAudioSession.sharedInstance()
//        do { try session.setActive(true) } catch { print(error) }
//        do { try session.setCategory(AVAudioSessionCategoryPlayback) } catch { print(error) }
        return Singleton.instance
    }
    
    
    
    public func play(musicURL: NSURL?) {
        
        let item = AVPlayerItem(URL: musicURL!)
        player = AVPlayer(playerItem: item)
//        player = AVPlayer(URL: musicURL!)
        player?.play()
     
    }
    
    public func play(musicURL: NSURL?,callBack: (finished:String) -> ()){
    
        play(musicURL)
        callBack(finished: "test")
    }
    

}
