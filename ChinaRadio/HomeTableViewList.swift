//
//	HomeTableViewList.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class HomeTableViewList : NSObject, NSCoding{

	var detail : [HomeTableViewDetail]!
	var id : String!
	var name : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		detail = [HomeTableViewDetail]()
		if let detailArray = dictionary["detail"] as? [NSDictionary]{
			for dic in detailArray{
				let value = HomeTableViewDetail(fromDictionary: dic)
				detail.append(value)
			}
		}
		id = dictionary["id"] as? String
		name = dictionary["name"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if detail != nil{
			var dictionaryElements = [NSDictionary]()
			for detailElement in detail {
				dictionaryElements.append(detailElement.toDictionary())
			}
			dictionary["detail"] = dictionaryElements
		}
		if id != nil{
			dictionary["id"] = id
		}
		if name != nil{
			dictionary["name"] = name
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         detail = aDecoder.decodeObjectForKey("detail") as? [HomeTableViewDetail]
         id = aDecoder.decodeObjectForKey("id") as? String
         name = aDecoder.decodeObjectForKey("name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if detail != nil{
			aCoder.encodeObject(detail, forKey: "detail")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if name != nil{
			aCoder.encodeObject(name, forKey: "name")
		}

	}

}