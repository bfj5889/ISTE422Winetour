//
//  NoteTableVC.swift
//  winetour
//
//  Created by Dustin Spitz on 12/11/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class NoteTableVC: UITableViewController, DataModelFinishedDelegate {
    var dataDict: NSDictionary!

    var noteList = Notes()
    var notes: [Note]{
        get{
            return self.noteList.noteList
        }
        set(val){
            return self.noteList.noteList = val
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        loadNotesData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    /***************************************************
     Function to load all wines to the app
     ***************************************************/
    func loadNotesData(){
        /** Constant Variables **/
        let GET_ALL_WINES_URL = "http://kelvin.ist.rit.edu/~winetour/winetour2/api/note/getAllNotes.php"
        
        // Intiantiate a Data Model object to retrieve all wines passing in no params
        let dm = DataModel()
        dm.delegate = self
        dm.sendData(urlString: GET_ALL_WINES_URL, postParamterString: "accountID=5")
        
    } // end of loadWineData
    
    func receivedData(dataModelResponse:NSDictionary) {
        self.dataDict = dataModelResponse
        
        let tempArray = (self.dataDict.value(forKey: "Notes") as! NSArray) as Array
        
        // Loop through and create all the wine objects
        for note in tempArray{
            print("Wine in Temp")
            print("\(note)")
            
            //let noteID         = note["noteID"]! as! String
            //let accountID      = note["accountID"]! as! String
            let title          = note["title"]! as! String
            let desc           = note["description"]! as! String
            let noteDate       = note["date"]! as! String

            let n = Note(title: title, description: desc, noteDate: noteDate)
            
            notes.append(n)
            
        }
        
        
        do_table_refresh()
        
        let hadError = self.dataDict["error"] as! Bool?
        //print("Does the email exist? ")
        //print(hadError)
        
        if (hadError == true){
            self.throwOkError(title:"Couldn't get all notes" , message:"Please contact Administrator")
        }
    }
    
    func do_table_refresh()
    {
        DispatchQueue.main.async(execute: {
            self.tableView.reloadData()
            return
        })
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
