//
//  EditProfileVC.swift
//  winetour
//
//  Created by Brianna Jones (RIT Student) on 12/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var userFNameTxtFld: UITextField!
    @IBOutlet weak var userLNameTxtFld: UITextField!
    
    @IBAction func updateProfileBtn(_ sender: UIButton) {
    }
    
    @IBAction func cancelEditBtn(_ sender: UIButton) {
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
