//
//	ListenBookDetail.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ListenBookDetail : NSObject, NSCoding{

	var id : String!
	var img : String!
	var title : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["id"] as? String
		img = dictionary["img"] as? String
		title = dictionary["title"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if id != nil{
			dictionary["id"] = id
		}
		if img != nil{
			dictionary["img"] = img
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
         id = aDecoder.decodeObjectForKey("id") as? String
         img = aDecoder.decodeObjectForKey("img") as? String
         title = aDecoder.decodeObjectForKey("title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if img != nil{
			aCoder.encodeObject(img, forKey: "img")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}

	}

}