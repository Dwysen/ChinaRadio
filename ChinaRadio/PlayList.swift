//
//	PlayList.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PlayList : NSObject, NSCoding{

	var collectNum : String!
	var created : String!
	var downloadsNum : String!
	var id : String!
	var listenNum : String!
	var shareNum : String!
	var title : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		collectNum = dictionary["collect_num"] as? String
		created = dictionary["created"] as? String
		downloadsNum = dictionary["downloads_num"] as? String
		id = dictionary["id"] as? String
		listenNum = dictionary["listen_num"] as? String
		shareNum = dictionary["share_num"] as? String
		title = dictionary["title"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if collectNum != nil{
			dictionary["collect_num"] = collectNum
		}
		if created != nil{
			dictionary["created"] = created
		}
		if downloadsNum != nil{
			dictionary["downloads_num"] = downloadsNum
		}
		if id != nil{
			dictionary["id"] = id
		}
		if listenNum != nil{
			dictionary["listen_num"] = listenNum
		}
		if shareNum != nil{
			dictionary["share_num"] = shareNum
		}
		if title != nil{
			dictionary["title"] = title
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         collectNum = aDecoder.decodeObjectForKey("collect_num") as? String
         created = aDecoder.decodeObjectForKey("created") as? String
         downloadsNum = aDecoder.decodeObjectForKey("downloads_num") as? String
         id = aDecoder.decodeObjectForKey("id") as? String
         listenNum = aDecoder.decodeObjectForKey("listen_num") as? String
         shareNum = aDecoder.decodeObjectForKey("share_num") as? String
         title = aDecoder.decodeObjectForKey("title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if collectNum != nil{
			aCoder.encodeObject(collectNum, forKey: "collect_num")
		}
		if created != nil{
			aCoder.encodeObject(created, forKey: "created")
		}
		if downloadsNum != nil{
			aCoder.encodeObject(downloadsNum, forKey: "downloads_num")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if listenNum != nil{
			aCoder.encodeObject(listenNum, forKey: "listen_num")
		}
		if shareNum != nil{
			aCoder.encodeObject(shareNum, forKey: "share_num")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}

	}

}