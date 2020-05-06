//
//  MapaViewController.swift
//  GuideUJA_UI
//
//  Created by Javier Aranda Izquierdo on 05/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    //API CLLocationManagetr
    private let locationManager = CLLocationManager();
    
    //Posicion actual
    private var currentCoordinate: CLLocationCoordinate2D?
    
    // Nuestro MapView
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()
    }
    
    private func configureLocationServices(){
         locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
    
        //Si la autorizacion del usuario para utilizar la localizacion no la sabemos
        if status == .notDetermined{
            //En nuestro caso, elegimos la autorizacion para siempre
            locationManager.requestAlwaysAuthorization()
            
         //Si ya nos ha dado autorizacion previa
        }else if status == .authorizedAlways || status == .authorizedWhenInUse{
            //Ahora podemos mostrar la localizacion ya que el usuario nos ha dado permiso
            mapView.showsUserLocation = true;
            //Dejamos que elija la exactitud que considere mejor
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            //Vamos actualizando la localizacion
            locationManager.startUpdatingLocation()
            
        }
    }
    
    //Funcion que hace zoom en una parte especifica del pama
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D){
        
        //Hacemos zoom en 1000 m alrededor
        let zoomRegion = MKCoordinateRegion(center: coordinate,latitudinalMeters: 1000,longitudinalMeters: 1000)
        //Permitimos que este zoom se modifique por el usuario
        mapView.setRegion(zoomRegion, animated: true)
        
    }
}


extension MapaViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")
        
        guard let latestLocation = locations.first else {return}
        
        currentCoordinate = latestLocation.coordinate
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
    }

    //El usuario tiene que dar permiso para ver la localizacion para actualizarla
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("the status chaged")
    }
}
