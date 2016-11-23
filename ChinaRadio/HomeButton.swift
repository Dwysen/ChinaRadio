//
//  HomeButton.swift
//  ChinaRadio
//
//  Created by irishsky on 16/11/7.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit

class HomeButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.width = self.width
        imageView?.height = self.width
        imageView?.x = 0
        imageView?.y = 0
        imageView?.backgroundColor = UIColor.yellowColor()
        
        titleLabel?.x = 0
        titleLabel?.y = (imageView?.height)! + 5
        titleLabel?.width = self.width
        titleLabel?.height = smallTitleLabelHeight
    }

    
}
