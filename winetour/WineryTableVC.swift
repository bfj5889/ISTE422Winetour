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
    
    func receivedData(dataModelResponse:NSDictionary) {
    }//end of receivedData
    

}// end of WineryTableVC



//tabBarController = window?.rootViewController as? UITabBarController
//let mapVC = tabBarController!.viewControllers![0] as! MapVC
//let navVC = tabBarController!.viewControllers![1] as! UINavigationController
