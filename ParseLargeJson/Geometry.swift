//
//	Geometry.swift
//
//	Create by hans on 24/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Geometry : NSObject{

	var coordinates : [[[AnyObject]]]!
	var type : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		type = json["type"].stringValue
	}



}
