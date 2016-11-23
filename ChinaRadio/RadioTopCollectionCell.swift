//
//  RadioHomeCollectionCell.swift
//  ChinaRadio
//
//  Created by irishsky on 16/11/5.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import Kingfisher

class RadioTopCollectionCell: UICollectionViewCell {
   
    var homeContent:HomeScrollViewContent?{
        didSet{
        ImageView.kf_setImageWithURL(NSURL(string: homeContent!.imageUrl)!)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ImageView)
    }
    
    private lazy var ImageView:UIImageView = {
        let ImageView = UIImageView(frame: self.bounds)
        return ImageView
        }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
