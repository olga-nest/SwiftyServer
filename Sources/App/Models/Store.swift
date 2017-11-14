//
//  Store.swift
//  Hello
//
//  Created by Olga on 11/13/17.
//

import Foundation
import Vapor
import Fluent

class Store: NSObject {
   
    //MARK: Properties
//    var storeKey = ""
//    var storeValue = ""
    var allInfo = [String: String]()
    
    let defaults = UserDefaults.standard
    
    
    func set(key: String, value: String){
       defaults.removeObject(forKey: "allInfo")
        allInfo[key] = value
        if defaults.object(forKey: "allInfo") == nil {
            setDict(dict: allInfo as NSDictionary)
        } else {
//        let object =
            
//            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:jsonObject];
//            [data writeToFile:path atomically:YES
           defaults.setValue(value, forKey: key)
        }
    }
    
    func allItems() -> [String] {
        var tempArr = [String]()
        let dict = getDict()
        
        for (k, v) in dict  {
            tempArr.append("\(k) \(v)")
        }
        return tempArr
    }
    
    func get(key: String) -> String? {
        let dictionary = getDict()
        let temp = dictionary[key]
        return temp
    }
    
    func setDict(dict: NSDictionary) {
        let data = NSKeyedArchiver.archivedData(withRootObject: dict)
        defaults.set(data, forKey:"allInfo")
    }
    
    func getDict() -> Dictionary<String, String> {
        let data = defaults.object(forKey: "allInfo") as! NSData
        let object = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! NSDictionary
        let tempDict = object as! [String : String]
        return tempDict
    }
    
   
}
