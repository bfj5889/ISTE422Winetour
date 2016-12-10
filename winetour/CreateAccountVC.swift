//
//  CreateAccountVC.swift
//  winetour
//
//  Created by Brianna Jones (RIT Student) on 12/6/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit



class CreateAccountVC: UIViewController, DataModelFinishedDelegate {
    
    var dataDict: NSDictionary = [:]
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var pwdTextFld: UITextField!
    @IBOutlet weak var userTypeControl: UISegmentedControl!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    @IBAction func createAccount(_ sender: AnyObject) {
        
        let urlString = "http://kelvin.ist.rit.edu/~winetour/winetour2/api/account/createAccount.php"
        
        let email = emailTxtFld.text!
        let pwd = pwdTextFld.text!
        
        //formating date into a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dob = dateFormatter.string(from: dobPicker.date)
        print(dob)
        
        var userType: String
        switch userTypeControl.selectedSegmentIndex {
        case 0:
            userType = "public"
        case 1:
            userType = "winery"
        default:
            userType = "public"
        }
        
        let postParameterString = "email=" + email + "&password=" + pwd + "&userType=" + userType +  "&dob=" + dob
        print(email)
        print(pwd)
        
        if (email != "" || pwd != "") {
           
            //Creating an instance of the data model
            let dataModel = DataModel()
            //Creating a delegate for the data model that will allow dataModel to communicate with the DataModelFinishedDelegate protocol
            dataModel.delegate = self
            //send the query information to the dataModel
            dataModel.sendData(urlString: urlString, postParamterString: postParameterString)
            
        } else {
            throwOkError(title:"Can't Create Account" , message: "Email/Password Invalid Info")
        }
        
        
        //Need to check for error and make a pop up if it failed
    }
    
    func throwOkError(title:String , message: String){
        let failedLoginAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        //adding ok button to failedLoginALert action
        failedLoginAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(failedLoginAlert, animated: true, completion: nil)
    }
    
    /**
     return user to the sign in page
     **/
    @IBAction func signInBtn(_ sender: UIButton) {
        //grab the story board
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        //create instance of the createAccount view
        let returnLoginController = storyBoard.instantiateInitialViewController()
        self.present(returnLoginController!, animated:true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func receivedData(dataModelResponse:NSDictionary) {
        self.dataDict = dataModelResponse
        print("printing dataModelResponse")
        print(dataModelResponse)
        
        let hadError = self.dataDict["error"] as! Bool?
        print("Does the email exist? ")
        print(hadError)
        
        if (hadError == true){
            self.throwOkError(title:"Can't Create Account" , message:"Account with that email is already created.")
        }
        
        // if account can be made go to home page
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
