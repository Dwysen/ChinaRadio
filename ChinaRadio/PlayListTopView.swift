//
//  PlayListTopView.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/13.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class PlayListTopView: UIView {

    var content:PlayListTopContent?{
        didSet{
       
            bgImageView.kf_setImageWithURL(NSURL(string: content!.bigMoImgUrl)!)
            imageView.kf_setImageWithURL(NSURL(string: content!.smallMoImgUrl)!)
            zhuboLabel.text = "主播:" + content!.editorName
            introduceTextView.text = "简介:" + content!.introtext

            
        }
    
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        bgImageView.frame = self.bounds
        addSubview(bgImageView)
        
        effectView.frame = self.bounds
        bgImageView.addSubview(effectView)
        
        addSubview(imageView)

        addSubview(zhuboLabel)

        addSubview(introduceTextView)
       
        
        imageView.snp_makeConstraints { (make) in
            make.top.left.equalTo(self).offset(10)
            make.height.width.equalTo(130)
    
        }
        
        zhuboLabel.snp_makeConstraints { (make) in
            make.top.equalTo(imageView.snp_top)
            make.left.equalTo(imageView.snp_right).offset(10)
            make.width.equalTo(200)
        }
        
        introduceTextView.snp_makeConstraints { (make) in
     
            make.top.equalTo(zhuboLabel.snp_bottom).offset(5)
            make.left.equalTo(zhuboLabel.snp_left)
            make.bottom.right.equalTo(self).offset(-10)
        
        }
        
    }
    
    
    
    private lazy var bgImageView:UIImageView = {
    
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var effectView:UIVisualEffectView = {
    
        let effectView = UIVisualEffectView(effect:UIBlurEffect(style:.Light ))
        return effectView
    }()
    
    private lazy var imageView:UIImageView = {
    let imageView = UIImageView()
        return imageView
    
    }()
    
    private lazy var zhuboLabel:UILabel = {
        let zhuboLabel = UILabel()
        return zhuboLabel
        
    }()
    
    private lazy var introduceTextView:UITextView = {
        let introduceTextView = UITextView()
//
        introduceTextView.backgroundColor = UIColor.clearColor()
        introduceTextView.font = UIFont.systemFontOfSize(13)
        return introduceTextView
        
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}
