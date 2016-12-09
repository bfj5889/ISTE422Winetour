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
var myJSON: NSDictionary?
class DataModel {
    var emptyDictionary:NSDictionary = [:]
    var delegate:DataModelFinishedDelegate?
    
    func sendData(urlString: String , postParamterString: String) {
        emptyDictionary = ["error": "nil"]
        
        print("parameter string " + postParamterString)
        print("url string " + urlString)
        
        //var myJSON: NSDictionary?
        //creating URLRequest
        var request = URLRequest(url: (NSURL(string: urlString)) as! URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //creating the post parameter by concatenating the keys and values from text field
        //adding the parameters to request body
        request.httpBody = postParamterString.data(using: String.Encoding.utf8)
        
        //creating a task to send the post request
        DispatchQueue.main.async(execute: {
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                print("printing json 1")
                print(myJSON)
                if let parseJSON = myJSON {
                    DispatchQueue.main.async(execute: {
                       self.delegate?.receivedData(dataModelResponse: parseJSON)
                    })
                    
                }
            } catch {
                print(error)
            }
            
        } //end of let task
        
        //executing the task
        task.resume()
        })
    
    }//end of sendData method
} //end of SendData Class
