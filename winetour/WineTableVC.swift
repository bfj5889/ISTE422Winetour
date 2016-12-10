//
//  WineTableVC.swift
//  winetour
//
//  Created by Dustin Spitz on 12/9/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class WineTableVC: UITableViewController, DataModelFinishedDelegate  {
    // Dictionary to pull data from SQL Database
    var dataDict: NSDictionary!
    
    // Wine Model to hold list of wine for application display
    var wineList = Wines()
    var wines : [Wine] {
        get{
            return wineList.wineList
        }
        set(val){
            return wineList.wineList = val
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Load wine Data
        loadWineData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    /***************************************************
     Function to load all wines to the app
     ***************************************************/
    func loadWineData(){
        /** Constant Variables **/
        let GET_ALL_WINES_URL = "http://kelvin.ist.rit.edu/~winetour/winetour2/api/wine/getAllWines.php"
        
        // Intiantiate a Data Model object to retrieve all wines passing in no params
        let dm = DataModel()
        dm.delegate = self
        dm.sendData(urlString: GET_ALL_WINES_URL, postParamterString: "")
        
//        let tempWines = ((self.dataDict["Wines"]!) as! NSArray) as Array
//        
//        for wine in tempWines{
//            let brand = wine["brand"]! as! String
//            
//            print("\(brand)")
//        }
//         print("Print Temp Wines")
//        if let tempWines = (self.dataDict.value(forKey: "Wines") as! NSArray) as Array
//        
//        print("\(tempWines)")

        
        
//        let tempWines = (self.dataDict.value(forKey: "Wines") as! NSArray) as Array
//        
//        for wine in tempWines{
//            print("\(wine)")
//        }
        
        
        
    } // end of loadWineData
    
    func receivedData(dataModelResponse:NSDictionary) {
        self.dataDict = dataModelResponse
        //print("printing dataModelResponse")
        //print(dataModelResponse)
        
        //print("As array999999999999999999999999999999999")
        //print( (((self.dataDict["Wines"]!) as! NSArray) as Array)[0]["wineName"]!!)
        //print( (((self.dataDict["Wines"]!) as! NSArray) as Array)[1]["wineName"]!!)

        let tempArray = (self.dataDict.value(forKey: "Wines") as! NSArray) as Array
        
        // Loop through and create all the wine objects
        for wine in tempArray{
            //print("\(wine["brand"]!)")
            
            let name = wine["wineName"]! as! String
            let brand = wine["brand"]! as! String
            print("\(name)  \(brand)")
        }
        
        //print( ( ((self.dataDict["Wines"]!) as! NSArray) as Array!))

        
        let hadError = self.dataDict["error"] as! Bool?
        //print("Does the email exist? ")
        //print(hadError)
        
        if (hadError == true){
            self.throwOkError(title:"Can't Create Account" , message:"Account with that email is already created.")
        }
    }
    
    func throwOkError(title:String , message: String){
        let failedLoginAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        //adding ok button to failedLoginALert action
        failedLoginAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(failedLoginAlert, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
