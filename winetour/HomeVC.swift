//
//  HomeVC.swift
//  winetour
//
//  Created by Dustin Spitz on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class HomeVC: UIViewController{
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        
        defaults.setValue("", forKey: defaultKeys.email)
        defaults.setValue("", forKey: defaultKeys.lastLogin)
        defaults.setValue("", forKey: defaultKeys.accountID)
        
        //return to login screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let loginPage = storyBoard.instantiateInitialViewController()
        self.present(loginPage!, animated:true, completion:nil)
        defaults.synchronize()
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
