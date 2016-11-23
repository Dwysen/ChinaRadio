//
//	PlayListTopStream.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PlayListTopStream : NSObject, NSCoding{

	var downLoad : String!
	var androidUrl : String!
	var appleUrl : String!
	var bitstreamType : String!
	var countParams : String!
	var streamName : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		downLoad = dictionary["DownLoad"] as? String
		androidUrl = dictionary["androidUrl"] as? String
		appleUrl = dictionary["appleUrl"] as? String
		bitstreamType = dictionary["bitstreamType"] as? String
		countParams = dictionary["countParams"] as? String
		streamName = dictionary["streamName"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if downLoad != nil{
			dictionary["DownLoad"] = downLoad
		}
		if androidUrl != nil{
			dictionary["androidUrl"] = androidUrl
		}
		if appleUrl != nil{
			dictionary["appleUrl"] = appleUrl
		}
		if bitstreamType != nil{
			dictionary["bitstreamType"] = bitstreamType
		}
		if countParams != nil{
			dictionary["countParams"] = countParams
		}
		if streamName != nil{
			dictionary["streamName"] = streamName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         downLoad = aDecoder.decodeObjectForKey("DownLoad") as? String
         androidUrl = aDecoder.decodeObjectForKey("androidUrl") as? String
         appleUrl = aDecoder.decodeObjectForKey("appleUrl") as? String
         bitstreamType = aDecoder.decodeObjectForKey("bitstreamType") as? String
         countParams = aDecoder.decodeObjectForKey("countParams") as? String
         streamName = aDecoder.decodeObjectForKey("streamName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if downLoad != nil{
			aCoder.encodeObject(downLoad, forKey: "DownLoad")
		}
		if androidUrl != nil{
			aCoder.encodeObject(androidUrl, forKey: "androidUrl")
		}
		if appleUrl != nil{
			aCoder.encodeObject(appleUrl, forKey: "appleUrl")
		}
		if bitstreamType != nil{
			aCoder.encodeObject(bitstreamType, forKey: "bitstreamType")
		}
		if countParams != nil{
			aCoder.encodeObject(countParams, forKey: "countParams")
		}
		if streamName != nil{
			aCoder.encodeObject(streamName, forKey: "streamName")
		}

	}

}