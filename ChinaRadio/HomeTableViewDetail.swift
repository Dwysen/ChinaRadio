//
//	HomeTableViewDetail.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class HomeTableViewDetail : NSObject, NSCoding{

	var blog : String!
	var contentId : String!
	var id : String!
	var img : String!
	var name : String!
	var title : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		blog = dictionary["blog"] as? String
		contentId = dictionary["content_id"] as? String
		id = dictionary["id"] as? String
		img = dictionary["img"] as? String
		name = dictionary["name"] as? String
		title = dictionary["title"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if blog != nil{
			dictionary["blog"] = blog
		}
		if contentId != nil{
			dictionary["content_id"] = contentId
		}
		if id != nil{
			dictionary["id"] = id
		}
		if img != nil{
			dictionary["img"] = img
		}
		if name != nil{
			dictionary["name"] = name
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
         blog = aDecoder.decodeObjectForKey("blog") as? String
         contentId = aDecoder.decodeObjectForKey("content_id") as? String
         id = aDecoder.decodeObjectForKey("id") as? String
         img = aDecoder.decodeObjectForKey("img") as? String
         name = aDecoder.decodeObjectForKey("name") as? String
         title = aDecoder.decodeObjectForKey("title") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if blog != nil{
			aCoder.encodeObject(blog, forKey: "blog")
		}
		if contentId != nil{
			aCoder.encodeObject(contentId, forKey: "content_id")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if img != nil{
			aCoder.encodeObject(img, forKey: "img")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}

	}

}