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
    init(title: String, description: String, noteDate: String){
        super.init()
        // Set All Variables
        self.setTitle(title)
        self.setNoteDescription(description)
        self.setDate(noteDate)
        
    }
    
    convenience override init() {
        self.init(title: "Unknown", description: "Unknown", noteDate: "Unknown")
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
    
    /*******************************************************************************
     Validation
     *******************************************************************************/
    
} // end of Winery
