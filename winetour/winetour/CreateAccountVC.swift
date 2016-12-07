//
//  CreateAccountVC.swift
//  winetour
//
//  Created by Brianna Jones (RIT Student) on 12/6/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    

    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var pwdTextFld: UITextField!
    @IBOutlet weak var userTypeControl: UISegmentedControl!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    @IBAction func createAccount(_ sender: AnyObject) {
        
        let urlString = "http://kelvin.ist.rit.edu/~winetour/winetour/api/createAccount.php"
        
        let email = emailTxtFld.text!
        let pwd = pwdTextFld.text!
        
        //formating date into a string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dob = dateFormatter.string(from: dobPicker.date)
        print(dob)

        switch userTypeControl.selectedSegmentIndex {
        case 0:
            let userType = "Public"
        case 1:
            let userType = "Winery"
        default:
            let userType = "Public"
        }
        
        /**THIS STRING IS NOT FINISHED need to add user type**/
        let postParameterString = "email=" + email + "&password=" + pwd + "&dob=" + dob
        
        let dataDict: NSDictionary = SendData().sendData(urlString: urlString, postParamterString: postParameterString)
        
        //Need to check for error and make a pop up if it failed
    }
    
    /**
     return user to the sign in page
     **/
    @IBAction func signInBtn(_ sender: UIButton) {
        //grab the story board
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        //create instance of the createAccount view
        //let createAccountController = storyBoard.instantiateViewController(withIdentifier: "login") as! LoginVC
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
