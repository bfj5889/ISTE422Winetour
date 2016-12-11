//
//  WineryDetailGroupVC.swift
//  winetour
//
//  Created by Dustin Spitz on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class WineryTableDetailGroupVC: UITableViewController {
    
    var winery:Winery!
    
    // CONSTANTS
    var WINERY_NAME = 0
    
    // ADDRESS GROUP (ADDRES, CITY, STATE ZIPCODE, COUNTRY)
    var WINERY_DESC = 1
    
    var ADDRESS_GROUP = 2
    var PHONE_NUMBER = 4
    var WINERY_WEBSITE = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    /**
     *  ADD TITLES FOR SECTIONS
     */
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch section{
        case WINERY_NAME:
            title = "Winery Name"
        case WINERY_DESC:
            title = "Description"
        case ADDRESS_GROUP:
            title = "Address"
        case PHONE_NUMBER:
            title = "Phone Number"
        default:
            break
            
        }
        return title
    }
    
    /**
     *  FILL IN INFORMATION
     */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        
        // Create Programmatically
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        }
        
        // Swap
        switch indexPath.section{
        case WINERY_NAME:
            cell?.textLabel?.text = winery.getWineryName()
        case WINERY_DESC:
            cell?.textLabel?.text = winery.getWineryDescription()
        case ADDRESS_GROUP:
            if winery.getAddress() != "" && winery.getState() != "" && winery.getCity() != "" && winery.getZipCode() != "0" {
                cell?.textLabel?.text = "\(winery.getAddress()) \n \(winery.getCity()) , \(winery.getState()) \(winery.getZipCode())"
            } else {
                cell?.textLabel?.text = winery.getAddress()
            }
        case PHONE_NUMBER:
            cell?.textLabel?.text = winery.getPhone()
        case WINERY_WEBSITE:
            cell?.textLabel?.text = "Visit Our Website"
        default:
            break
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        cell?.textLabel?.numberOfLines = 0 // Use as many lines as you need
        return cell!
    }
    
    /**
     *  IF SECTION SELECTED PERFORM ACTION
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section{
        case WINERY_WEBSITE:
            UIApplication.shared.open(NSURL(string: winery.getWebsite() )! as URL)
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5 // number of white fill section
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
}
