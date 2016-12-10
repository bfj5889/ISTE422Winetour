//
//  WineryMapVC.swift
//  winetour
//
//  Created by Student on 12/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import MapKit

class WineryMapVC: UIViewController, MKMapViewDelegate, ZoomingProtocol, DataModelFinishedDelegate {

    func receivedData(dataModelResponse:NSDictionary) {
    
    }
    
    func zoomOnAnnotation(_ annotation: MKAnnotation){
        tabBarController?.selectedViewController = self
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 2500, 2500)
//        mapView.setRegion(region, animated: true)
//        mapView.selectAnnotation(annotation, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
