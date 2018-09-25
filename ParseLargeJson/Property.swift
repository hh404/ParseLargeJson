//
//	Property.swift
//
//	Create by hans on 24/9/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import SwiftyJSON


class Property : NSObject{

	var bLKLOT : String!
	var bLOCKNUM : String!
	var fROMST : String!
	var lOTNUM : String!
	var mAPBLKLOT : String!
	var oDDEVEN : String!
	var sTREET : String!
	var sTTYPE : String!
	var tOST : String!


	/**
	 * Instantiate the instance using the passed json values to set the properties values
	 */
	init(fromJson json: JSON!){
		if json.isEmpty{
			return
		}
		bLKLOT = json["BLKLOT"].stringValue
		bLOCKNUM = json["BLOCK_NUM"].stringValue
		fROMST = json["FROM_ST"].stringValue
		lOTNUM = json["LOT_NUM"].stringValue
		mAPBLKLOT = json["MAPBLKLOT"].stringValue
		oDDEVEN = json["ODD_EVEN"].stringValue
		sTREET = json["STREET"].stringValue
		sTTYPE = json["ST_TYPE"].stringValue
		tOST = json["TO_ST"].stringValue
	}

	

}
