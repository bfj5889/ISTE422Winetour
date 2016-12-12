//
//  Winery.swift
//  winetour
//
//  Created by Dustin Spitz on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

class Note: NSObject{
    /*******************************************************************************
     Winery Variables
     *******************************************************************************/
    
    // INT(11)
    private var accountID : String = ""
    
    // INT(11)
    private var noteID : String = ""
    
    // varchar(100)
    private var title : String = ""
    
    // VARCHAR(15)
    private var noteDescription : String = ""
    
    // VARCHAR(15)
    private var noteDate : String = ""
    
    
    /*******************************************************************************
     INITIALIZERS
     > Init
     > Convenience
     > Description
     *******************************************************************************/
    init(accountID: String, noteID: String, title: String, description: String, noteDate: String){
        super.init()
        // Set All Variables
        self.setTitle(title)
        self.setNoteDescription(description)
        self.setDate(noteDate)
        
    }
    
    convenience override init() {
        self.init(accountID: "Unknown", noteID: "unknown", title: "Unknown", description: "Unknown", noteDate: "Unknown")
    }
    
    //custom to String (informal)
    override var description: String{
        return "\tTitle: \(title) \t\nDecription: \(noteDescription) \t\n noteDate: \(noteDate)"
    }
    
    /*******************************************************************************
     GETTERS SETTERS
     *******************************************************************************/
    
    func getTitle() -> String{
        return title
    }
    
    func setTitle(_ value: String) {
        title = value
    }
    
    func getNoteDescription() -> String{
        return noteDescription
    }
    func setNoteDescription(_ value: String) {
        noteDescription = value
    }
    
    func getDate() -> String{
        return noteDate
    }
    func setDate(_ value: String) {
        noteDate = value
    }
    
    func getAccountID() -> String{
        return accountID
    }
    func setAccountID(_ value: String) {
        accountID = value
    }
    
    func getNoteID() -> String{
        return noteID
    }
    func setNoteID(_ value: String) {
        noteID = value
    }
    
    /*******************************************************************************
     Validation
     *******************************************************************************/
    
} // end of Winery
