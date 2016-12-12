//
//  Winery.swift
//  winetour
//
//  Created by Student on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import MapKit

class Winery: NSObject, MKAnnotation{
    

    @objc var title: String? {
        get{
            return getWineryName()
        }
    }
    
    @objc var subtitle: String? {
        get{
            return getState()
        }
    }
    
    /*******************************************************************************
     Winery Variables
     *******************************************************************************/
    
    // INT(11)
    private var accountID : String = ""
    
    // INT(11)
    private var wineryID : String = ""
    
    // varchar(100)
    private var wineryName : String = ""
    
    // VARCHAR(15)
    private var longitude : String = ""
    
    // VARCHAR(15)
    private var latitude : String = ""
    
    // VARCHAR(100)
    private var address : String = ""
    
    // VARCHAR(100)
    private var city : String = ""
    
    // VARCHAR(2)
    private var state : String = ""
    
    // VARCHAR(5)
    private var zipCode : String = ""
    
    // VARCHAR(30)
    private var country : String = ""
    
    // BIGINT(10)
    private var phone : String = ""
    
    // TEXT
    private var wineryDescription : String = ""
    
    // VARCHAR(100)
    private var website : String = ""
    
    private var location : CLLocation?
    
    // Conform to MKProtocol
    
    @objc var coordinate: CLLocationCoordinate2D {
        get{
            return getLocation()!.coordinate
        }
    }
    
    
    /*******************************************************************************
     INITIALIZERS
     > Init
     > Convenience
     > Description
     *******************************************************************************/
    init(accountID: String, wineryID: String, wineryName: String, address: String, city: String, state: String, zipCode: String, country: String, phone: String, wineryDescription: String, website: String, location:CLLocation?){
        super.init()
        // Set All Variables
        self.accountID = accountID
        self.wineryID = wineryID
        self.setWineryName(wineryName)
        self.setAddress(address)
        self.setCity(city)
        self.setState(state)
        self.setZipCode(zipCode)
        self.setCountry(country)
        self.setPhone(phone)
        self.setWineryDescription(wineryDescription)
        self.setWebsite(website)
        self.setLocation(location)
        
    }
    
    convenience override init() {
        self.init(accountID: "Unknown", wineryID: "Unknown", wineryName: "Unknown", address: "Unknown", city: "Unknown", state: "Unknown", zipCode: "Unknown", country: "Unknown", phone: "Unknown", wineryDescription: "No Description", website: "No Website given", location: nil)
    }
    
    //custom to String (informal)
    override var description: String{
        return "\tacccountID: \(accountID) \n \twineryID: \(wineryID) \n \twineryName: \(wineryName) \n \n \taddress: \(address) \n \tcity: \(city) \n \tstate: \(state) \n \tzipCode \(zipCode) \n \tcountry: \(country) \n \tphone: \(phone) \n \twineryDescription: \(wineryDescription) \n \twebsite: \(website) \n "
    }
    
    /*******************************************************************************
     GETTERS SETTERS
     *******************************************************************************/
    
    //Location variables
    func getLocation() -> CLLocation?{
        return location
    }
    func setLocation(_ value: CLLocation?) {
        location = value
    }
    
    // WineID
    func getAccountID() -> String{
        return accountID
    }
    
    // WineryID
    func getWineryID() -> String{
        return wineryID
    }
    
    // WineryName
    func getWineryName() -> String{
        return wineryName
    }
    
    func setWineryName(_ value:String){
        wineryName = value
    }
    
    // Longitude
    func getLongitude() -> String{
        return longitude
    }
    
    func setLongitude(_ value:String){
        longitude = value
    }
    
    // Latitude
    func getLatitude() -> String{
        return latitude
    }
    
    func setLatitude(_ value:String){
        latitude = value
    }
    
    // Address
    func getAddress() -> String{
        return address
    }
    
    func setAddress(_ value:String){
        address = value
    }
    
    // City
    func getCity() -> String{
        return city
    }
    
    func setCity(_ value:String){
        city = value
    }
    
    // State
    func getState() -> String{
        return state
    }
    
    func setState(_ value:String){
        state = value
    }
    
    // ZipCode
    func getZipCode() -> String{
        return zipCode
    }
    
    func setZipCode(_ value:String){
        zipCode = value
    }
    
    // Country
    func getCountry() -> String{
        return country
    }
    
    func setCountry(_ value:String){
        country = value
    }
    
    // Phone
    func getPhone() -> String{
        return phone
    }
    
    func setPhone(_ value:String){
        phone = value
    }
    
    // Winery Description
    func getWineryDescription() -> String{
        return wineryDescription
    }
    
    func setWineryDescription(_ value:String){
        wineryDescription = value
    }
    
    // Website
    func getWebsite() -> String{
        return website
    }
    
    func setWebsite(_ value:String){
        website = value
    }
    
    /*******************************************************************************
     Validation
     *******************************************************************************/
    
} // end of Winery
