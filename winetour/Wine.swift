//
//  Wine.swift
//  winetour
//
//  Created by Dustin Spitz on 12/7/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation

/**
 *  Create a Wine Model that loads all wine data into wine Objects
 */

class Wine: NSObject{
    
        //optional
//        @objc var title: String? {
//            get{
//                return getParkName()
//            }
//        }
//        
//        @objc var subtitle: String? {
//            get{
//                return "Formed on \(getParkLocation())"
//            }
//        }
    
    /*******************************************************************************
        Wine Variables
    *******************************************************************************/

    // INT
    private var wineID : String = ""
    
    // INT
    private var wineryID : String = ""
    
    // VARCHAR(100)
    private var wineName : String = ""
    
    // TEXT
    private var wineDescription : String = ""
    
    // VARCHAR(50)
    private var brand : String = ""
    
    // INT
    private var wineYear : String = ""
    
    // ENUM('RED, 'WHITE', 'OTHER')
    private var wineType : String = ""
    
    // ENUM('Pinot Gris','Sparkling Blend','Fruit','Pinot Noir','Cabernet Franc','Rose','Cabernet Merlot','Blush','Chardonnay','Riesling','Pinot Grigio','Merlot','Pinot Noir','Cabernet Suavignon','Blend','Other')
    private var varietal : String = ""
    
    // ENUM('Very Sweet','Sweet','Semi-Sweet','Semi-Dry','Dry','Very Dry')
    private var dryness : String = ""
    
    // FLOAT
    private var residualSugar : String = ""
    
    // FLOAT
    private var percentAlcohol : String = ""
    
    // VARCHAR 200
    private var image : String = ""
    
    // VARCHAR(50)
    private var region : String = ""
    
    /*******************************************************************************
     INITIALIZERS
        > Init
        > Convenience
        > Description
     *******************************************************************************/
    init(wineID: String, wineryID: String, wineName: String, brand: String, wineYear: String, varietal: String, dryness: String, residualSugar: String, percentAlcohol: String, image: String, region: String, wineType: String, wineDesc:String){
        super.init()
        // Set All Variables
        self.setWineID(wineID)
        self.setWineryID(wineryID)
        self.setWineName(wineName)
        self.setBrand(brand)
        self.setWineYear(wineYear)
        self.setVarietal(varietal)
        self.setDryness(dryness)
        self.setResidualSugar(residualSugar)
        self.setPercentAlcohol(percentAlcohol)
        self.setImage(image)
        self.setRegion(region)
        self.setWineType(wineType)
        self.setWineDescription(wineDesc)
    }
    
    convenience override init() {
        self.init(wineID: "Unknown", wineryID: "Unknown", wineName: "Unknown", brand: "Unknown", wineYear: "Unknown", varietal: "Unknown", dryness: "Unknown", residualSugar: "Unknown", percentAlcohol: "Unknown", image: "Unknown", region: "Unknown", wineType: "Unknown", wineDesc: "Unknown")
    }
    
    //custom to String (informal)
    override var description: String{
        return "\twineID: \(wineID) \n \twineryID: \(wineryID) \n \twineName: \(wineName) \n \twineDescription: \(wineDescription) \n \tbrand: \(brand) \n \twinYear: \(wineYear) \n \tvarietal: \(varietal) \n \tdryness: \(dryness) \n\tresidualSugar: \(residualSugar)\n \tpercentAlcohol: \(percentAlcohol) \n\timage: \(image) \n\tregion: \(region)"
    }
    /*******************************************************************************
        GETTERS SETTERS
     *******************************************************************************/

    // WineID
    func getWineID() -> String{
        return wineID
    }
    
    func setWineID(_ value:String){ // Not set in Swift
        wineID = value
    }
    
    // WineryID
    func getWineryID() -> String{
        return wineryID
    }
    
    func setWineryID(_ value:String){
        wineryID = value
    }
    
    // WineName
    func getWineName() -> String{
        return wineName
    }
    
    func setWineName(_ value:String){
        wineName = value
    }
    
    // WineDescription
    func getWineDescription() -> String{
        return wineDescription
    }
    
    func setWineDescription(_ value:String){
        wineDescription = value
    }
    
    // Brand
    func getBrand() -> String{
        return brand
    }
    
    func setBrand(_ value:String){
        brand = value
    }
    
    // wineYear
    func getWineYear() -> String{
        return wineYear
    }
    
    func setWineYear(_ value:String){
        wineYear = value
    }
    
    // Winetype
    func getWineType() -> String{
        return wineType
    }
    
    func setWineType(_ value:String){
        wineType = value
    }
    
    // Varietal
    func getVarietal() -> String{
        return varietal
    }
    
    func setVarietal(_ value:String){
        varietal = value
    }
    
    // Dryness
    func getDryness() -> String{
        return dryness
    }
    
    func setDryness(_ value:String){
        dryness = value
    }
    
    // Residual Sugar
    func getResidualSugar() -> String{
        return residualSugar
    }
    
    func setResidualSugar(_ value:String){
        residualSugar = value
    }
    
    // Percent Alcohol
    func getPercentAlcohol() -> String{
        return percentAlcohol
    }
    
    func setPercentAlcohol(_ value:String){
        percentAlcohol = value
    }
    
    // Image
    func getImage() -> String{
        return image
    }
    
    func setImage(_ value:String){
        image = value
    }
    
    // Region
    func getRegion() -> String{
        return region
    }
    
    func setRegion(_ value:String){
        region = value
    }

    /*******************************************************************************
     Validation
     *******************************************************************************/

} // end of Wine
