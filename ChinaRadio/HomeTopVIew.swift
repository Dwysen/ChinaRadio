//
//  HomeTopVIew.swift
//  ChinaRadio
//
//  Created by Dwysen on 16/11/5.
//  Copyright © 2016年 王彦森. All rights reserved.
//

import UIKit
import SnapKit

protocol TopViewDidClickedCollection {
    func TopViewDidClickedCollection(id:Int)
}


class HomeTopView: UIView {
    
    var delegete:TopViewDidClickedCollection?
    var homeContents:[HomeScrollViewContent]?{
        didSet{
        self.setupTopView()
        }
    }
    var homeChannels:[HomeChannel]? {
        didSet{
          self.setupChannelsCollecionView()
        
        }
    
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
      }
    func setupTopView(){
        
        addSubview(TopcollecitonView)
    
        addSubview(labelZhiBo)
        
        addSubview(buttonMore)
        
        labelZhiBo.snp_makeConstraints { (make) in
            make.top.equalTo(TopcollecitonView.snp_bottom).offset(10)
            make.left.equalTo(self.snp_left).offset(5)
            
        }
        
        buttonMore.snp_makeConstraints { (make) in
            make.centerY.equalTo(labelZhiBo)
            make.right.equalTo(self.snp_right).offset(-5)
        }
        
     
    
    }
    func setupChannelsCollecionView(){
        
        addSubview(BottomcollecitonView)
        
        BottomcollecitonView.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.snp_bottom).offset(-10)
            make.left.right.equalTo(self)
            make.height.equalTo(50)
        }
        
//        self.snp_makeConstraints { (make) in
//            make.bottom.equalTo(BottomcollecitonView.snp_bottom).offset(10)
//        }
    
    }
    
    private lazy var TopcollecitonView:UICollectionView = {
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, SCREENW, 200), collectionViewLayout: RadioTopCollectionLayout())
        collectionView.registerClass(RadioTopCollectionCell.self, forCellWithReuseIdentifier: "RadioTopCollectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var labelZhiBo:UILabel = {
        let label = UILabel()
        label.text = "直播"
        label.textColor = UIColor.greenColor()
        label.font = UIFont.systemFontOfSize(16)
        return label
        
    }()
    
    private lazy var buttonMore:UIButton = {
    
        let btn = UIButton()
        btn.setTitle("更多>", forState: .Normal)
        btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(12)
        
        return btn
        
        
    }()
    
    private lazy var BottomcollecitonView:UICollectionView = {
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 0, SCREENW, 50), collectionViewLayout: RadioBottomCollectionLayout())
        collectionView.backgroundColor = UIColor.whiteColor()
        let nib = UINib(nibName: "RadioBottomCollecionCell", bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: "RadioBottomCollecionCell")
        collectionView.dataSource = self
        return collectionView
    }()

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension HomeTopView:UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == TopcollecitonView{
        return homeContents!.count
        } else {
    
        return homeChannels!.count
            
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView == TopcollecitonView{
            
            let item = collectionView.dequeueReusableCellWithReuseIdentifier("RadioTopCollectionCell", forIndexPath: indexPath) as! RadioTopCollectionCell
            item.homeContent = homeContents![indexPath.item]
            return item
            
        } else {
            
            let item = collectionView.dequeueReusableCellWithReuseIdentifier("RadioBottomCollecionCell", forIndexPath: indexPath) as! RadioBottomCollecionCell
               item.channel = homeChannels![indexPath.item]
            return item
            
            
        }
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
        let id = Int(homeContents![indexPath.item].id)!
        delegete?.TopViewDidClickedCollection(id)
    
        
        
    }

    
    
}

private class RadioTopCollectionLayout:UICollectionViewFlowLayout{
    
    private override func prepareLayout() {
        itemSize = CGSizeMake(SCREENW, 200)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
        
    }
    
}

private class RadioBottomCollectionLayout:UICollectionViewFlowLayout{
    
    private override func prepareLayout() {
        itemSize = CGSizeMake(120, 50)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .Horizontal
        
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
        
    }
    
}

