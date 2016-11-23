//
//	PlayListTopContent.swift
//	模型生成器（小波汉化）JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class PlayListTopContent : NSObject, NSCoding{

	var advertising : String!
	var bigMoImgUrl : String!
	var collectionNum : String!
	var downloads : String!
	var editorName : String!
	var id : String!
	var introtext : String!
	var keyword : String!
	var listenNum : String!
	var materials : [PlayListTopMaterial]!
	var programId : String!
	var refUrl : String!
	var shareNum : String!
	var smallMoImgUrl : String!
	var studioby : String!
	var title : String!
	var videotype : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		advertising = dictionary["advertising"] as? String
		bigMoImgUrl = dictionary["bigMoImgUrl"] as? String
		collectionNum = dictionary["collection_num"] as? String
		downloads = dictionary["downloads"] as? String
		editorName = dictionary["editorName"] as? String
		id = dictionary["id"] as? String
		introtext = dictionary["introtext"] as? String
		keyword = dictionary["keyword"] as? String
		listenNum = dictionary["listen_num"] as? String
		materials = [PlayListTopMaterial]()
		if let materialsArray = dictionary["materials"] as? [NSDictionary]{
			for dic in materialsArray{
				let value = PlayListTopMaterial(fromDictionary: dic)
				materials.append(value)
			}
		}
		programId = dictionary["programId"] as? String
		refUrl = dictionary["ref_url"] as? String
		shareNum = dictionary["share_num"] as? String
		smallMoImgUrl = dictionary["smallMoImgUrl"] as? String
		studioby = dictionary["studioby"] as? String
		title = dictionary["title"] as? String
		videotype = dictionary["videotype"] as? Int
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if advertising != nil{
			dictionary["advertising"] = advertising
		}
		if bigMoImgUrl != nil{
			dictionary["bigMoImgUrl"] = bigMoImgUrl
		}
		if collectionNum != nil{
			dictionary["collection_num"] = collectionNum
		}
		if downloads != nil{
			dictionary["downloads"] = downloads
		}
		if editorName != nil{
			dictionary["editorName"] = editorName
		}
		if id != nil{
			dictionary["id"] = id
		}
		if introtext != nil{
			dictionary["introtext"] = introtext
		}
		if keyword != nil{
			dictionary["keyword"] = keyword
		}
		if listenNum != nil{
			dictionary["listen_num"] = listenNum
		}
		if materials != nil{
			var dictionaryElements = [NSDictionary]()
			for materialsElement in materials {
				dictionaryElements.append(materialsElement.toDictionary())
			}
			dictionary["materials"] = dictionaryElements
		}
		if programId != nil{
			dictionary["programId"] = programId
		}
		if refUrl != nil{
			dictionary["ref_url"] = refUrl
		}
		if shareNum != nil{
			dictionary["share_num"] = shareNum
		}
		if smallMoImgUrl != nil{
			dictionary["smallMoImgUrl"] = smallMoImgUrl
		}
		if studioby != nil{
			dictionary["studioby"] = studioby
		}
		if title != nil{
			dictionary["title"] = title
		}
		if videotype != nil{
			dictionary["videotype"] = videotype
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         advertising = aDecoder.decodeObjectForKey("advertising") as? String
         bigMoImgUrl = aDecoder.decodeObjectForKey("bigMoImgUrl") as? String
         collectionNum = aDecoder.decodeObjectForKey("collection_num") as? String
         downloads = aDecoder.decodeObjectForKey("downloads") as? String
         editorName = aDecoder.decodeObjectForKey("editorName") as? String
         id = aDecoder.decodeObjectForKey("id") as? String
         introtext = aDecoder.decodeObjectForKey("introtext") as? String
         keyword = aDecoder.decodeObjectForKey("keyword") as? String
         listenNum = aDecoder.decodeObjectForKey("listen_num") as? String
         materials = aDecoder.decodeObjectForKey("materials") as? [PlayListTopMaterial]
         programId = aDecoder.decodeObjectForKey("programId") as? String
         refUrl = aDecoder.decodeObjectForKey("ref_url") as? String
         shareNum = aDecoder.decodeObjectForKey("share_num") as? String
         smallMoImgUrl = aDecoder.decodeObjectForKey("smallMoImgUrl") as? String
         studioby = aDecoder.decodeObjectForKey("studioby") as? String
         title = aDecoder.decodeObjectForKey("title") as? String
         videotype = aDecoder.decodeObjectForKey("videotype") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if advertising != nil{
			aCoder.encodeObject(advertising, forKey: "advertising")
		}
		if bigMoImgUrl != nil{
			aCoder.encodeObject(bigMoImgUrl, forKey: "bigMoImgUrl")
		}
		if collectionNum != nil{
			aCoder.encodeObject(collectionNum, forKey: "collection_num")
		}
		if downloads != nil{
			aCoder.encodeObject(downloads, forKey: "downloads")
		}
		if editorName != nil{
			aCoder.encodeObject(editorName, forKey: "editorName")
		}
		if id != nil{
			aCoder.encodeObject(id, forKey: "id")
		}
		if introtext != nil{
			aCoder.encodeObject(introtext, forKey: "introtext")
		}
		if keyword != nil{
			aCoder.encodeObject(keyword, forKey: "keyword")
		}
		if listenNum != nil{
			aCoder.encodeObject(listenNum, forKey: "listen_num")
		}
		if materials != nil{
			aCoder.encodeObject(materials, forKey: "materials")
		}
		if programId != nil{
			aCoder.encodeObject(programId, forKey: "programId")
		}
		if refUrl != nil{
			aCoder.encodeObject(refUrl, forKey: "ref_url")
		}
		if shareNum != nil{
			aCoder.encodeObject(shareNum, forKey: "share_num")
		}
		if smallMoImgUrl != nil{
			aCoder.encodeObject(smallMoImgUrl, forKey: "smallMoImgUrl")
		}
		if studioby != nil{
			aCoder.encodeObject(studioby, forKey: "studioby")
		}
		if title != nil{
			aCoder.encodeObject(title, forKey: "title")
		}
		if videotype != nil{
			aCoder.encodeObject(videotype, forKey: "videotype")
		}

	}

}