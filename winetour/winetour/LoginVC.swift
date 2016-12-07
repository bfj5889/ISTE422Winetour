//
//  LoginVC.swift
//  winetour
//
//  Created by Student on 12/5/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    /** Constant Variables **/
    let LOGIN_URL = "http://kelvin.ist.rit.edu/~winetour/winetour/api/login.php"
    
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var pwdTxtFld: UITextField!
    
    /*** 
    Starts validation process when user presses button.
    If successful:
        Takes user to tab bar controller of app
    If unsucessful:
        Creates OK action alert to notify user of invalid credentials
    ***/
    @IBAction func loginBtn(_ sender: UIButton) {
        //getting values from text fields
        let email = emailTxtFld.text
        let pwd = pwdTxtFld.text
        
        //created NSURL
        let requestURL = NSURL(string: LOGIN_URL)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        

        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "email="+email!+"&password="+pwd!;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        //creating varaible that will be used to check if log in was successful from json
        var hadError : Bool?
        
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
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response by parts
                    msg = parseJSON["message"] as! String?
                    hadError = parseJSON["error"] as! Bool?
                    
                    //printing the response
                    print(msg)
                    print(hadError ?? true)
                    
                    DispatchQueue.main.async(execute: {
                        if parseJSON["error"] as! Bool? == true { //failed to login
                            //creating the failed login alert
                            let failedLoginAlert = UIAlertController(title: "Failed To Log In", message: "Email or Password Incorrect. Press 'OK' to try again.", preferredStyle: UIAlertControllerStyle.alert)
                            //adding ok button to failedLoginALert action
                            failedLoginAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(failedLoginAlert, animated: true, completion: nil)
                        } else if parseJSON["error"] as! Bool? == false { //success full login
                            
                        } else { //error from db during log in
                            
                        }
                    })
                }
            } catch {
                print(error)
            }
            //error connecting to db
            hadError = false
            
        } //end of let task
        
        //executing the task
        task.resume()
        
    }

    
    /***
     Starts using account creation process when user presses button
     ***/
    @IBAction func createAccoutnBtn(_ sender: UIButton) {
        //grab the story board
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        //create instance of the createAccount view
        let createAccountController = storyBoard.instantiateViewController(withIdentifier: "createAccount") as! CreateAccountVC
        self.present(createAccountController, animated:true, completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
} // end of LoginVC class
