//
//  WineryTableVC.swift
//  winetour
//
//  Created by Student on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import UIKit

class WineryTableVC: UITableViewController, DataModelFinishedDelegate {
    // Dictionary to pull data from SQL Database
    var dataDict: NSDictionary!
    
    // Wine Model to hold list of wine for application display
    var wineryList = Wineries()
    var wineries : [Winery] {
        get{
            return wineryList.wineryList
        }
        set(val){
            return wineryList.wineryList = val
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load winery Data
        loadWineryData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    /***************************************************
     Function to load all winery to the app
     ***************************************************/
    func loadWineryData(){
        /** Constant Variables **/
        let GET_ALL_WINERIES_URL = "http://kelvin.ist.rit.edu/~winetour/winetour2/api/winery/getAllWineries.php"
        
        // Intiantiate a Data Model object to retrieve all wines passing in no params
        let dm = DataModel()
        dm.delegate = self
        dm.sendData(urlString: GET_ALL_WINERIES_URL, postParamterString: "")
        
    } // end of loadWineData
    
    func receivedData(dataModelResponse:NSDictionary) {
        self.dataDict = dataModelResponse
        
        let tempArray = (self.dataDict.value(forKey: "Wineries") as! NSArray) as Array
        print("The temp array")
        print(tempArray)
        
        // Loop through and create all the wine objects
        for winery in tempArray{
            print("Winery in Temp")
            print("\(winery)")
            
            let accountID = winery["accountID"] as! String
            let wineryID = winery["wineryID"]! as! String
            let wineryName = winery["wineryName"]! as! String
            let longitude = winery["longitude"] as! String
            let latitude = winery["latitude"] as! String
            let address = winery["address"] as! String
            let city = winery["city"] as! String
            let state = winery["state"] as! String
            let zipCode = winery["zipCode"] as! String
            let country = winery["country"] as! String
            let phone = winery["phone"] as! String
            let wineryDescription = winery["description"] as! String
            let website = winery["website"] as! String
            
            let newWinery = Winery(accountID: accountID, wineryID: wineryID, wineryName: wineryName, longitude: longitude, latitude: latitude, address: address, city: city, state: state, zipCode: zipCode, country: country, phone: phone, wineryDescription: wineryDescription, website: website)
            wineries.append(newWinery)
        }
        
        print("Wines Array")
        print("Wine Count : \(wineries.count)")
        print("\(wineries)")
        print("Get First Wine")
        print("\(wineries[0])")
        
        do_table_refresh()
        
        let hadError = self.dataDict["error"] as! Bool?
        
        if (hadError == true){
            self.throwOkError(title:"Error in database." , message:"Wineries can not be found. Restart app and try again")
        }
    }
    
    func throwOkError(title:String , message: String){
        let failedLoginAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        failedLoginAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(failedLoginAlert, animated: true, completion: nil)
    }
    

    func do_table_refresh()
    {
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            return
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("Wine Count in number of row in section : \(wineries.count)")
        return wineries.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "winery", for: indexPath)
        
        // Configure the cell...
        let w = wineries[indexPath.row]
        cell.textLabel?.text = w.getWineryName()
        cell.detailTextLabel?.text = w.getState()
        
//        if let url = URL(string: "http://kelvin.ist.rit.edu/~winetour/winetour2/images/\(w.getImage()).png") {
//            if let data = NSData(contentsOf: url) {
//                cell.imageView?.image = UIImage(data: data as Data)
//                cell.imageView?.sizeToFit()
//            }
//        }
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
}// end of WineryTableVC
