//
//  CheckUserLogin.swift
//  winetour
//
//  Created by Student on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class CheckUserLogin {
    
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
    let documentDirectory = paths[0] as! String
    let path = documentDirectory.appending("UserInfo.plist")
    let fileManager = FileManager.default
    if(!fileManager.fileExists(atPath: path)){
    if let bundlePath = Bundle.main.path(forResource: "UserInfo", ofType: "plist"){
    let result = NSMutableDictionary(contentsOfFile: bundlePath)
    print("Bundle file UserInfo is -> \(result?.description)")
    do{
    try fileManager.copyItem(atPath: bundlePath, toPath: path)
    }catch{
    print("copy failure.")
    }
    }else{
    print("file myData.plist not found.")
    }
    }else{
    print("file myData.plist already exits at path.")
    }
    
    let resultDictionary = NSMutableDictionary(contentsOfFile: path)
    print("load myData.plist is ->\(resultDictionary?.description)")
    
    let myDict = NSDictionary(contentsOfFile: path)
    if let dict = myDict{
        myItemValue = dict.object(forKey: myItemKey) as! String?
        txtValue.text = myItemValue
    }else{
    print("load failure.")
    }
    
}
