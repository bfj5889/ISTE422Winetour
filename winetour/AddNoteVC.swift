//
//  AddNoteVC.swift
//  winetour
//
//  Created by Dustin Spitz on 12/12/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class AddNoteVC: UIViewController, UITextFieldDelegate {

    let ADD_NOTE_URL = "http://kelvin.ist.rit.edu/~winetour/winetour2/api/note/createNote.php"
    
    @IBOutlet weak var noteTitle: UITextField!
    
    @IBOutlet weak var noteDescription: UITextView!
    
    
    @IBAction func addNote(_ sender: Any) {
        //getting values from text fields
        let noteT = noteTitle.text
        let noteD = noteDescription.text
        
        //created NSURL
        let requestURL = NSURL(string: ADD_NOTE_URL)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        let defaults = UserDefaults.standard
        let accountID = defaults.string(forKey: defaultKeys.accountID)
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "title="+noteT!+"&description="+noteD!+"&accountID="+accountID!;
        
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
                    var accountID : NSNumber
                    
                    //getting the json response by parts
                    msg = parseJSON["message"] as! String?
                    hadError = parseJSON["error"] as! Bool?
                    //accountID = parseJSON["accountID"] as! NSNumber!
                    //let accountIDString = String(describing: accountID)
                    
                    //printing the response
                    print(msg)
                    print(hadError ?? true)
                    
                    DispatchQueue.main.async(execute: {
                        if parseJSON["error"] as! Bool? == true { //failed to create note
                            //creating the failed login alert
                            let failedNote = UIAlertController(title: "Failed To Create Note", message: "Try Again.", preferredStyle: UIAlertControllerStyle.alert)
                            //adding ok button to failedLoginALert action
                            failedNote.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(failedNote, animated: true, completion: nil)
                        } else if parseJSON["error"] as! Bool? == false { //success uploaded note
                            
                            let goodNote = UIAlertController(title: "Success", message: "Note Created", preferredStyle: UIAlertControllerStyle.alert)
                            //adding ok button to failedLoginALert action
                            goodNote.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(goodNote, animated: true, completion: nil)
                            self.pushUserBackToAddNote()
                            
            
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
     Push the User to the Home page after login
     ***/
    func pushUserBackToAddNote() {
        //grab the story board
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        //create instance of the createAccount view
        let addNote = storyBoard.instantiateViewController(withIdentifier: "addNote") as! UITableViewController
        self.present(addNote, animated:true, completion:nil)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.noteTitle.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.noteDescription.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTitle.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
