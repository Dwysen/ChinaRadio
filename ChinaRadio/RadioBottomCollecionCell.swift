//
//  RadioBottomCollecionCell.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/5.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import Kingfisher

class RadioBottomCollecionCell: UICollectionViewCell {
    @IBOutlet weak var channelName: UILabel!

    @IBOutlet weak var channeIcon: UIImageView!
    
    var channel:HomeChannel?{
        didSet{
            channelName.text = channel?.channelName
            channeIcon.kf_setImageWithURL(NSURL(string: channel!.icon)!)
        
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

}
