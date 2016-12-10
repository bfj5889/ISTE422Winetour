//
//  ZommingProtocol.swift
//  FavoritePlaces
//
//  Created by Student on 11/10/16.
//  Copyright © 2016 Student. All rights reserved.
//

import Foundation
import MapKit


/****** Defining a contract. That says if you want to implement this protocol this method must be implemented ******/
protocol ZoomingProtocol {
    func zoomOnAnnotation(_ annotation: MKAnnotation)
}
