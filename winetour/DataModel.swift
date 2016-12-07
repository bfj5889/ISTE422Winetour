//
//  SendData.swift
//  winetour
//
//  Created by Student on 12/6/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit
/****
 
 
 ****/
class DataModel {
    var myJSON: NSDictionary?
    
    func sendData(urlString: String , postParamterString: String, httpMethod: String) -> NSDictionary {
        print("parameter string " + postParamterString)
        print("url string " + urlString)
        
        //var myJSON: NSDictionary?
        //creating URLRequest
        var request = URLRequest(url: (NSURL(string: urlString)) as! URL)
        
        //setting the method to post
        request.httpMethod = httpMethod
        
        //creating the post parameter by concatenating the keys and values from text field
        //adding the parameters to request body
        request.httpBody = postParamterString.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                self.myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if let parseJSON = self.myJSON {
                    var msg : String!
                    msg = parseJSON["message"] as! String?
                    let error = parseJSON["error"] as! Bool?
                    print("printing message and error status")
                    print(msg)
                    print(error)
                }
            } catch {
                print(error)
            }
            
        } //end of let task
        
        //executing the task
        task.resume()
        print("the json")
        //print(self.myJSON)
        if (self.myJSON == nil){
            let emptyDictionary = [String: String]()
            return emptyDictionary as NSDictionary
        }else{
            return self.myJSON!
        }
//        DispatchQueue.main.async(execute: {
//            return myJSON!
//        })
        
    }//end of sendData method
} //end of SendData Class
