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
    
    func set(key: String, value: String){
        allInfo[key] = value
    }
    
    func allItems() -> [String] {
        var tempArr = [String]()
        
        for (k, v) in allInfo {
            tempArr.append("\(k) \(v)")
        }
        
        return tempArr
    }
    
    func get(key: String) -> String? {
        return allInfo[key]
    }
    
   
}
