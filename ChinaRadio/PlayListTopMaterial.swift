//
//	PlayListTopMaterial.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PlayListTopMaterial : NSObject, NSCoding{

	var playUrl : String!
	var programVideoId : String!
	var streams : [PlayListTopStream]!
	var videoName : String!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		playUrl = dictionary["PlayUrl"] as? String
		programVideoId = dictionary["programVideoId"] as? String
		streams = [PlayListTopStream]()
		if let streamsArray = dictionary["streams"] as? [NSDictionary]{
			for dic in streamsArray{
				let value = PlayListTopStream(fromDictionary: dic)
				streams.append(value)
			}
		}
		videoName = dictionary["videoName"] as? String
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if playUrl != nil{
			dictionary["PlayUrl"] = playUrl
		}
		if programVideoId != nil{
			dictionary["programVideoId"] = programVideoId
		}
		if streams != nil{
			var dictionaryElements = [NSDictionary]()
			for streamsElement in streams {
				dictionaryElements.append(streamsElement.toDictionary())
			}
			dictionary["streams"] = dictionaryElements
		}
		if videoName != nil{
			dictionary["videoName"] = videoName
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         playUrl = aDecoder.decodeObjectForKey("PlayUrl") as? String
         programVideoId = aDecoder.decodeObjectForKey("programVideoId") as? String
         streams = aDecoder.decodeObjectForKey("streams") as? [PlayListTopStream]
         videoName = aDecoder.decodeObjectForKey("videoName") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if playUrl != nil{
			aCoder.encodeObject(playUrl, forKey: "PlayUrl")
		}
		if programVideoId != nil{
			aCoder.encodeObject(programVideoId, forKey: "programVideoId")
		}
		if streams != nil{
			aCoder.encodeObject(streams, forKey: "streams")
		}
		if videoName != nil{
			aCoder.encodeObject(videoName, forKey: "videoName")
		}

	}

}