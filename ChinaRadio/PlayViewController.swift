//
//  PlayViewController.swift
//  ChinaRadio
//
//  Created by irishsky on 16/11/13.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import AVFoundation
import Kingfisher

// MARK:         延时函数
// let delay = dispatch_time(DISPATCH_TIME_NOW,
//                          Int64(5 * Double(NSEC_PER_SEC)))
// dispatch_after(delay, dispatch_get_main_queue()) {
//     需要延时的操作
//}


class PlayViewController: UIViewController {

    static let playViewController = PlayViewController()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var currentPlayTimeLabel: UILabel!
    
    var totaltime : Float64?
    
    @IBOutlet weak var timeSlider: UISlider!
    
    @IBAction func dragTimeSlider(sender: UISlider) {
        let value = sender.value
        let maxValue = sender.maximumValue
        let percent = value/maxValue
        let setTime = Float64(percent) * totaltime!
        playerManager!.player?.seekToTime(CMTimeMake(Int64(setTime), 1))
    }
    
    @IBOutlet weak var totalPlayTimeLabel: UILabel!
    weak var playerManager = MusicPlayerManager.sharedInstance
    var playbackObsever:AnyObject?
    
    
    @IBAction func btnPause(sender: AnyObject) {

        if playerManager!.isPlaying == true{
            playerManager!.player?.pause()
            playerManager!.isPlaying = false
        }  else {
            playerManager!.player?.play()
            playerManager!.isPlaying = true
        }
    }
    
    var content:PlayListTopContent?{
        didSet{
            guard content?.materials.count != 0 else {
                print("materials count = 0")
                return
            }
            
            let materials = content!.materials[0]
            let test:[PlayListTopStream] = materials.streams
   
            guard test.count != 0 else{
               print("streams count = 0")
               return
            }

            let url = test[0].appleUrl
            let nsUrl = NSURL(string: url!)!

            playerManager!.play(nsUrl)
            playerManager!.isPlaying = true
            
  
        
            // MARK:-
            
        }
    }
    
            // MARK:析构函数
    
    deinit {
    
//        playerManager!.player?.removeTimeObserver(playbackObsever!)
        print("playViewController rellase")
    }
    
    //MARK:-
    
    //MARK: ——创造时间Label
    func formatTimeLabel(time:Float64) -> String {

         if time .isNaN {
        return "00:00"
        }
        
        let totolSecond = Int64(time)
        
        let minute = (totolSecond / 60 )
      
        let second = totolSecond % 60

        if minute < 10 && second < 10 {
            return "0\(minute):0\(second)"
        } else if minute > 9 && second < 10 {
            return "\(minute):0\(second)"
        } else if minute < 9 && second > 10 {
            return "0\(minute):\(second)"
        }  else {
            return "\(minute):\(second)"
        }
    }
            //MARK:
    
    @IBAction func TapBack(sender: UIButton) {
        self.dismissViewControllerAnimated(true) {
           
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setTimeObsearve()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        playerManager!.player?.removeTimeObserver(playbackObsever!)

    }

    func setTimeObsearve(){
        playbackObsever = playerManager!.player?.addPeriodicTimeObserverForInterval(CMTimeMake(1, 1), queue: dispatch_get_main_queue(), usingBlock: {[weak self] (time) in
            
            let currentTime = CMTimeGetSeconds(time)
            self!.currentPlayTimeLabel.text =  self!.formatTimeLabel(currentTime)
            let totolSecond = CMTimeGetSeconds( (self!.playerManager!.player?.currentItem?.duration)! )
            self!.totalPlayTimeLabel.text = self!.formatTimeLabel(totolSecond)
            self!.timeSlider.setValue(Float(currentTime/totolSecond), animated: true)
            self!.totaltime = totolSecond
            
        })
    
    }
    
    func setupUI(){
        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.removedOnCompletion = false
        imageView.layer.addAnimation(anim, forKey: nil)
        
        imageView.layer.cornerRadius = 100
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.grayColor().CGColor
        imageView.layer.borderWidth = 5

        var currentImgUrl:NSURL?
        var currentTitle:String?
        
        if content == nil {
         currentImgUrl = NSUserDefaults.standardUserDefaults().URLForKey("currentImgUrl")
         currentTitle = NSUserDefaults.standardUserDefaults().objectForKey("currentTitle") as? String
            guard currentImgUrl != nil else {
            print( "currentImageURL is nil")
            return
            }
        
            
        } else {
        currentImgUrl = NSURL(string: (content?.smallMoImgUrl)!)!
        currentTitle = content?.title
        NSUserDefaults.standardUserDefaults().setURL(currentImgUrl, forKey: "currentImgUrl")
        NSUserDefaults.standardUserDefaults().setObject(currentTitle, forKey: "currentTitle")
        
        }
        
        imageView.kf_setImageWithURL(currentImgUrl!)
    
        
        
        
        let effect = UIBlurEffect(style: .Light)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = bgImageView.bounds
        bgImageView.addSubview(effectView)
        bgImageView.kf_setImageWithURL(currentImgUrl!)
        

        
        titleLabel.text = currentTitle
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
