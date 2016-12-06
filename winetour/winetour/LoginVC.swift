//
//  LoginVC.swift
//  winetour
//
//  Created by Student on 12/5/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
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

    }

    /***
     Starts using account creation process when user presses button
     ***/
    @IBAction func createAccoutnBtn(_ sender: UIButton) {
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
