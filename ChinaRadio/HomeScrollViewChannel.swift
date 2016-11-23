//
//	HomeChannel.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class HomeChannel : NSObject, NSCoding{

	var channelId : Int!
	var channelName : String!
	var channelType : String!
	var collectNum : Int!
	var encoderId : AnyObject!
	var hz : String!
	var icon : String!
	var playNum : Int!
	var programName : String!
	var shareUrl : String!
//	var streams : [HomeStream]!
	var weiboName : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		channelId = dictionary["channelId"] as? Int
		channelName = dictionary["channelName"] as? String
		channelType = dictionary["channelType"] as? String
		collectNum = dictionary["collectNum"] as? Int
		encoderId = dictionary["encoderId"]
		hz = dictionary["hz"] as? String
		icon = dictionary["icon"] as? String
		playNum = dictionary["playNum"] as? Int
		programName = dictionary["programName"] as? String
		shareUrl = dictionary["shareUrl"] as? String
//		streams = [HomeStream]()
//		if let streamsArray = dictionary["streams"] as? [NSDictionary]{
////			for dic in streamsArray{
////				let value = HomeStream(fromDictionary: dic)
////				streams.append(value)
////			}
//		}
		weiboName = dictionary["weiboName"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if channelId != nil{
			dictionary["channelId"] = channelId
		}
		if channelName != nil{
			dictionary["channelName"] = channelName
		}
		if channelType != nil{
			dictionary["channelType"] = channelType
		}
		if collectNum != nil{
			dictionary["collectNum"] = collectNum
		}
		if encoderId != nil{
			dictionary["encoderId"] = encoderId
		}
		if hz != nil{
			dictionary["hz"] = hz
		}
		if icon != nil{
			dictionary["icon"] = icon
		}
		if playNum != nil{
			dictionary["playNum"] = playNum
		}
		if programName != nil{
			dictionary["programName"] = programName
		}
		if shareUrl != nil{
			dictionary["shareUrl"] = shareUrl
		}
//		if streams != nil{
//			var dictionaryElements = [NSDictionary]()
//			for streamsElement in streams {
//				dictionaryElements.append(streamsElement.toDictionary())
//			}
//			dictionary["streams"] = dictionaryElements
//		}
		if weiboName != nil{
			dictionary["weiboName"] = weiboName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         channelId = aDecoder.decodeObjectForKey("channelId") as? Int
         channelName = aDecoder.decodeObjectForKey("channelName") as? String
         channelType = aDecoder.decodeObjectForKey("channelType") as? String
         collectNum = aDecoder.decodeObjectForKey("collectNum") as? Int
         encoderId = aDecoder.decodeObjectForKey("encoderId")
         hz = aDecoder.decodeObjectForKey("hz") as? String
         icon = aDecoder.decodeObjectForKey("icon") as? String
         playNum = aDecoder.decodeObjectForKey("playNum") as? Int
         programName = aDecoder.decodeObjectForKey("programName") as? String
         shareUrl = aDecoder.decodeObjectForKey("shareUrl") as? String
//         streams = aDecoder.decodeObjectForKey("streams") as? [HomeStream]
         weiboName = aDecoder.decodeObjectForKey("weiboName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if channelId != nil{
			aCoder.encodeObject(channelId, forKey: "channelId")
		}
		if channelName != nil{
			aCoder.encodeObject(channelName, forKey: "channelName")
		}
		if channelType != nil{
			aCoder.encodeObject(channelType, forKey: "channelType")
		}
		if collectNum != nil{
			aCoder.encodeObject(collectNum, forKey: "collectNum")
		}
		if encoderId != nil{
			aCoder.encodeObject(encoderId, forKey: "encoderId")
		}
		if hz != nil{
			aCoder.encodeObject(hz, forKey: "hz")
		}
		if icon != nil{
			aCoder.encodeObject(icon, forKey: "icon")
		}
		if playNum != nil{
			aCoder.encodeObject(playNum, forKey: "playNum")
		}
		if programName != nil{
			aCoder.encodeObject(programName, forKey: "programName")
		}
		if shareUrl != nil{
			aCoder.encodeObject(shareUrl, forKey: "shareUrl")
		}
//		if streams != nil{
//			aCoder.encodeObject(streams, forKey: "streams")
//		}
		if weiboName != nil{
			aCoder.encodeObject(weiboName, forKey: "weiboName")
		}

	}

}