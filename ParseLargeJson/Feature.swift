//
//	Feature.swift
//
//	Create by hans on 24/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Feature : NSObject{

	var geometry : Geometry!
	var properties : Property!
	var type : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		let geometryJson = json["geometry"]
		if !geometryJson.isEmpty{
			geometry = Geometry(fromJson: geometryJson)
		}
		let propertiesJson = json["properties"]
		if !propertiesJson.isEmpty{
			properties = Property(fromJson: propertiesJson)
		}
		type = json["type"].stringValue
	}



}
