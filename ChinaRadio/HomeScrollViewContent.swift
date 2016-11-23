//
//	HomeScrollViewContent.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class HomeScrollViewContent : NSObject, NSCoding{

	var id : String!
	var imageUrl : String!
	var isContent : String!
	var linkUrl : String!
	var title : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["id"] as? String
		imageUrl = dictionary["image_url"] as? String
		isContent = dictionary["is_content"] as? String
		linkUrl = dictionary["link_url"] as? String
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
		if imageUrl != nil{
			dictionary["image_url"] = imageUrl
		}
		if isContent != nil{
			dictionary["is_content"] = isContent
		}
		if linkUrl != nil{
			dictionary["link_url"] = linkUrl
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
         imageUrl = aDecoder.decodeObjectForKey("image_url") as? String
         isContent = aDecoder.decodeObjectForKey("is_content") as? String
         linkUrl = aDecoder.decodeObjectForKey("link_url") as? String
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
		if imageUrl != nil{
			aCoder.encodeObject(imageUrl, forKey: "image_url")
		}
		if isContent != nil{
			aCoder.encodeObject(isContent, forKey: "is_content")
		}
		if linkUrl != nil{
			aCoder.encodeObject(linkUrl, forKey: "link_url")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}

	}

}