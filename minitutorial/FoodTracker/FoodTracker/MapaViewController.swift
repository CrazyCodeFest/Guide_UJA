//
//  MapaViewController.swift
//  FoodTracker
//
//  Created by Javier Aranda Izquierdo on 10/05/2020.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Damos una localizacion con la longitud y latitud
        let localizacion = CLLocation(latitude: 37.7874, longitude: -3.7769)
        //La distancia en radio que queremos visualizar
        let radio: CLLocationDistance = 2000.0
        //Creamos una region con los datos anteriores
        let region = MKCoordinateRegionMakeWithDistance(localizacion.coordinate, radio, radio)
        
        //A nuestro MapView le damos esa region
        MapView.setRegion(region, animated: true)
        
        MapView.delegate = self
    }
}

extension MapaViewController: MKMapViewDelegate{
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("renderizando....")
    }
}
