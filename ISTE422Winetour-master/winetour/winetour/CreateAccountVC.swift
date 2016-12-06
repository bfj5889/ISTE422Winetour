//
//  CreateAccountVC.swift
//  winetour
//
//  Created by Brianna Jones (RIT Student) on 12/6/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var userTypePickerView: UIPickerView!

    //Create options for the account type picker wheel
    let userType = ["Public","Winery"];
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userType.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return userType[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.view.backgroundColor = UIColor.red;
        }
        else if(row == 1)
        {
            self.view.backgroundColor = UIColor.red;
        }
    }
    
    //If c=segmented control is picked above information is not needed as well as the info in view did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userTypePickerView.dataSource = self;
        self.userTypePickerView.delegate = self;

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
