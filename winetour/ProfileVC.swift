//
//  ProfileVC.swift
//  winetour
//
//  Created by Brianna Jones (RIT Student) on 12/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, DataModelFinishedDelegate {

    // Dictionary to pull data from SQL Database
    var dataDict: NSDictionary!
    var profileDict : NSDictionary!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    @IBAction func editProfileBtn(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let wineryWall = storyBoard.instantiateViewController(withIdentifier: "profileEdit")
        self.present(wineryWall, animated:true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProfileData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /***************************************************
     Function to load all profile to the app
     ***************************************************/
    func loadProfileData(){
        /** Constant Variables **/
        let GET_PROFILE_URL = "http://kelvin.ist.rit.edu/~winetour/winetour2/api/account/getProfile.php"
        let defaults = UserDefaults.standard
        let accountID = defaults.string(forKey: defaultKeys.accountID)
        let postParameterString: String = "accountID=" + accountID!
        
        // Intiantiate a Data Model object to retrieve all wines passing in no params
        let dm = DataModel()
        dm.delegate = self
        dm.sendData(urlString: GET_PROFILE_URL, postParamterString: postParameterString)
        
    } // end of loadWineData
    
    func receivedData(dataModelResponse:NSDictionary) {
        self.dataDict = dataModelResponse
        
        let tempArray = (self.dataDict.value(forKey: "Profile") as! NSArray) as Array
        // Loop through and create all the profile objects
        print("printing temp array")
        print(tempArray)
        
        let fname = tempArray[0]["firstName"]! as! String
        let lname = tempArray[0]["lastName"]! as! String

        let name = "\(fname)  \(lname)"
        userNameLbl.text? = name

        print("\(name)")
        let hadError = self.dataDict["error"] as! Bool?
        
        if (hadError == true){
            self.throwOkError(title:"Error in database." , message:"Your profile could not be found. Restart app and try again")
        }
    }
    
    func throwOkError(title:String , message: String){
        let failedLoginAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        failedLoginAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(failedLoginAlert, animated: true, completion: nil)
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
