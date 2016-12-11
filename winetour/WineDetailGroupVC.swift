//
//  WineDetailGroupVC.swift
//  winetour
//
//  Created by Dustin Spitz on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class WineDetailGroupVC: UITableViewController {
    
    var wine:Wine!
    
    // CONSTANTS
    //let wineID         = wine["wineID"]! as! String
    
    
    let NAME        = 0
    let BRAND       = 1
    let WINE_YEAR   = 2
    let DESC        = 3
    
    // DETAIL GROUP 1
    let WINE_TYPE   = 4
    let REGION      = 5
    let PCT_ALCOHOL = 6
    let RES_SUGAR   = 7
    let DRYNESS     = 8
    let VARIETAL    = 9
    let IMAGE       = 10
    

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
        case NAME:
            title = "Wine Name"
        case DESC:
            title = "Description"
        case BRAND:
            title = "Brand"
        case WINE_YEAR:
            title = "Year"
        default:
            break
            
        }
        return title
    }

    /**
     *  IF SECTION SELECTED PERFORM ACTION
     */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var msg = "";
        
        switch indexPath.section{
        case NAME:
            msg = wine.getWineName()
        case DESC:
            msg = wine.getWineDescription()
        case BRAND:
            msg = wine.getBrand()
        case WINE_YEAR:
            msg = wine.getWineYear()
        default:
            break
        }
        
        // Pop up Alert
        let alert = UIAlertController(title: "Tapped a Row", message: msg, preferredStyle: .alert)
        
        // handler nil, don't need to do anything when they tap ok button
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
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
        case NAME:
            cell?.textLabel?.text = wine.getWineName()
        case DESC:
            cell?.textLabel?.text = wine.getWineDescription()
        case BRAND:
            cell?.textLabel?.text = wine.getBrand()
//            let url = URL(string: park.getImageLink())
//            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise
//            cell?.imageView?.image = UIImage(data: data!)
        case WINE_YEAR:
            cell?.textLabel?.text = wine.getWineYear()
        default:
            break
        }
        
        cell?.textLabel?.numberOfLines = 0 // Use as many lines as you need
        //cell?.textLabel?.backgroundColor = UIColor(red: 216.0, green: 216.0, blue: 216.0, alpha: 1.0)
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
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
