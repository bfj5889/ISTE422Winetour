//
//  WineryMapVC.swift
//  winetour
//
//  Created by Student on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class WineryMapVC: UIViewController, MKMapViewDelegate, ZoomingProtocol, DataModelFinishedDelegate{
    
    // Dictionary to pull data from SQL Database
    var dataDict: NSDictionary!
    var locationManager : CLLocationManager?
    var mePoint : MKPointAnnotation!
    var mkCoordinateRegion: MKCoordinateRegion!
    
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

    @IBOutlet weak var mapView: MKMapView!

    @IBAction func backToWineryWall(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let wineryWall = storyBoard.instantiateViewController(withIdentifier: "homepage") as! UITabBarController
        self.present(wineryWall, animated:true, completion:nil)
    }
    
    @IBAction func wineryMapSegmentedControl(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2: // or default
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
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
        // Loop through and create all the wine objects
        for winery in tempArray{
            //print("\(winery)")
            let accountID = winery["accountID"] as! String
            let wineryID = winery["wineryID"]! as! String
            let wineryName = winery["wineryName"]! as! String
            let address = winery["address"] as! String
            let city = winery["city"] as! String
            let state = winery["state"] as! String
            let zipCode = winery["zipCode"] as! String
            let country = winery["country"] as! String
            let phone = winery["phone"] as! String
            let wineryDescription = winery["description"] as! String
            let website = winery["website"] as! String
            
            let latitudeString = (winery["latitude"]! as! NSString)
            let latitude = Double(latitudeString as String)
            let longitudeString = (winery["longitude"]! as! NSString)
            let longitude = Double(longitudeString as String)
            
            let wineryLocation = CLLocation(latitude: latitude!, longitude: longitude!)
            
            let newWinery = Winery(accountID: accountID, wineryID: wineryID, wineryName: wineryName,  address: address, city: city, state: state, zipCode: zipCode, country: country, phone: phone, wineryDescription: wineryDescription, website: website, location:wineryLocation)
            
            wineries.append(newWinery)
        }
        
        
        for winery: MKAnnotation in wineries{
            mapView.addAnnotation(winery)
        }
        
        //        print("Wines Array")
        //        print("Wine Count : \(wineries.count)")
        //        print("\(wineries)")
        //        print("Get First Wine")
        //        print("\(wineries[0])")
        
        //do_table_refresh() // keeps winery count updated
        
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
    
    func zoomOnAnnotation(_ annotation: MKAnnotation){
        tabBarController?.selectedViewController = self
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 2500, 2500)
//        mapView.setRegion(region, animated: true)
//        mapView.selectAnnotation(annotation, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        // see if location services is enabled
        if CLLocationManager.locationServicesEnabled() {
            // Checks when running on ios 8
            if locationManager?.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)) != nil {
                locationManager!.requestWhenInUseAuthorization()
            }
        }
        
        loadWineryData()
        
        mapView.showsUserLocation = true
        
        mapView.delegate = self
        
        print("\(wineries)")
        // Do any additional setup after loading the view.
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let mePoint = MKPointAnnotation()
        mapView.removeAnnotation(mePoint)
        mapView.removeAnnotation(mePoint)
        mePoint.coordinate = userLocation.coordinate
        mePoint.title = "This is you"
        mePoint.subtitle = "Here you are"
        mapView.addAnnotation(mePoint)
        let userLocation = userLocation
        mkCoordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000)
    }
    
    /************************************
     Change MapView Functions
     ************************************/
    
    // Print Annotation to Console when MKAnnotation is selected
    func mapView(_ mv: MKMapView, didSelect view: MKAnnotationView) {
        let annotation = view.annotation
        print("The title of the annotation is: \(annotation!.title)")
    }
    
    // Called once for every annotation taht is created
    func mapView(_ mv: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view:MKPinAnnotationView
        let identifier = "Pin"
        
        if annotation is MKUserLocation{
            // Return nil so it will draw default view
            return nil
        }
        
        if annotation !== mv.userLocation {
            
            // look for an existing view to use
            if let dequeuedView = mv.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
                
            } else {
                
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.pinTintColor = MKPinAnnotationView.redPinColor()
                view.animatesDrop = true
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: -5)
                let leftButton = UIButton(type: .infoLight)
                let rightButton = UIButton(type: .detailDisclosure)
                leftButton.tag = 0
                rightButton.tag = 1
                view.leftCalloutAccessoryView = leftButton
                view.rightCalloutAccessoryView = rightButton
            }
            return view
        }
        return nil
        
    } // end of MapView
    
    // Left = wiki, right = navigation
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control.tag == 0{
            /* Old way to open site in browser app */
            //UIApplication.shared.openURL(NSURL(string: "\(currentAnnotation.getLink())")! as URL)
            if (view.annotation?.title)! != "My Location"{
                let currentAnnotation = view.annotation as! Winery
                let site = URL(string: currentAnnotation.getWebsite())
                if let checkURL = site {
                    if UIApplication.shared.canOpenURL(checkURL){
                        UIApplication.shared.open(site!, options: [:], completionHandler: nil)
                        print("url successfully opened")
                    }
                }
            } else{
                
            }
            
        }
        else if control.tag == 1{
            
            if (view.annotation?.title)! != "My Location"{
                let currentAnnotation = view.annotation as! Winery
                let parkName = currentAnnotation.getLocation()
                let placemark = MKPlacemark(coordinate: currentAnnotation.coordinate, addressDictionary: nil)
                let mapItem = MKMapItem(placemark: placemark)
                mapItem.name = "\(parkName)"
                //You could also choose: MKLaunchOptionsDirectionsModeWalking
                let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                mapItem.openInMaps(launchOptions: launchOptions)
            }
            else{
            }
        }
        else{
            print("Error in program")
        }
    }


    

}
