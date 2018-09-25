//
//  ViewController.swift
//  ParseLargeJson
//
//  Created by hans on 2018/9/24.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift


class TestDBModel: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

extension NSData {
    
    var hexString: String? {
        let buf = bytes.assumingMemoryBound(to: UInt8.self)
        let charA = UInt8(UnicodeScalar("a").value)
        let char0 = UInt8(UnicodeScalar("0").value)
        
        func itoh(_ value: UInt8) -> UInt8 {
            return (value > 9) ? (charA + value - 10) : (char0 + value)
        }
        
        let hexLen = length * 2
        let ptr = UnsafeMutablePointer<UInt8>.allocate(capacity: hexLen)
        
        for i in 0 ..< length {
            ptr[i*2] = itoh((buf[i] >> 4) & 0xF)
            ptr[i*2+1] = itoh(buf[i] & 0xF)
        }
        
        return String(bytesNoCopy: ptr, length: hexLen, encoding: .utf8, freeWhenDone: true)
    }
}

class ViewController: UIViewController {

        var realm: Realm?
    
    private func getJsonFromBundle(fileName : String) throws -> JSON {
        let fileName = fileName
        let jsonFilePath = Bundle.main.path(forResource: fileName, ofType: "json")
        let jsonData = try Data(contentsOf: URL(fileURLWithPath: jsonFilePath!), options: .alwaysMapped)
        let cardJson = JSON(data: jsonData)
        return cardJson
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        realm = getRealmObject()
        let ar = realm?.objects(TestDBModel.self)
        let a = 100
//        print(NSDate())
//        mapModel()
//        print(NSDate())
    }
    
    func mapModel()  {
        do{
            let json = try getJsonFromBundle(fileName: "citylots")
            let a = 222
            let f = json["features"].array
            print(f?.count)
            for item in f! {
                let model = Feature.init(fromJson: item)
                let db = TestDBModel()
                db.name = model.type
                realm = getRealmObject()
                try! realm?.write {
                    realm?.add(db)
                }
            }
            
        }
        catch{
            print(error)
        }
    }
    
    func getRealmObject() -> Realm {
        let s = "wwerwwerwwerwwerwwerwwerwwerwwerwwerwwerwwerwwerwwerwwerwwerwwer"
        let data:NSData = s.data(using: String.Encoding.utf8) as! NSData
        let str = data.hexString
        var encryptionConfiguration = Realm.Configuration(encryptionKey: data as Data,
                                                          schemaVersion: 1,
                                                          migrationBlock: { migration, oldSchemaVersion in
        }
        )
        encryptionConfiguration.fileURL = encryptionConfiguration.fileURL!.deletingLastPathComponent().appendingPathComponent("encryptionDB.realm")
        encryptionConfiguration.migrationBlock  = { migration, oldSchemaVersion in
            if (oldSchemaVersion < 2) {
            }
        }
        do {
            let realm = try Realm(configuration: encryptionConfiguration)
            return realm
        }
        catch {
            print("open realm fail")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: (encryptionConfiguration.fileURL?.path)!) {
                print("remove old realm db and recreate")
                
                
                let realm = try! Realm(configuration: encryptionConfiguration)
                return realm
            }
            else {
                let realm = try! Realm(configuration: encryptionConfiguration)
                return realm
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

