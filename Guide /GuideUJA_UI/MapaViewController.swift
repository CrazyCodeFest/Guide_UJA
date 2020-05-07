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

    //Objeto que utilizamos para empezar o parar el envio de evento de locacizacion
    private let locationManager = CLLocationManager();
    
    //Posicion actual
    private var currentCoordinate: CLLocationCoordinate2D?
    
    // Nuestro MapView
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Cuando se ha cargado la vista, configuramos los servicios de localizacion
        configureLocationServices()
    }
    
    private func configureLocationServices(){
        
        locationManager.delegate = self
        
        //Guardamos si tenemos autorizacion del usuario para usar los servicios de localizacion
        let status = CLLocationManager.authorizationStatus()
    
        //Si la autorizacion del usuario para utilizar la localizacion no la sabemos
        if status == .notDetermined{
            //En nuestro caso, pedimos autorizacion siempre
            locationManager.requestAlwaysAuthorization()
            
         //Si ya nos ha dado autorizacion previa
        }else if status == .authorizedAlways || status == .authorizedWhenInUse{
            //Llamamos a la funcion que nos permite mostrar la ubicacion
            beginLocationUpdates(locationManager: locationManager)
            
        }
    }
    
    //Funcion que hace zoom en una parte especifica del pama
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D){
        
        //Hacemos zoom en 1000 m alrededor
        let zoomRegion = MKCoordinateRegion(center: coordinate,latitudinalMeters: 40,longitudinalMeters: 40)
        
        //Permitimos que este zoom se modifique por el usuario
        mapView.setRegion(zoomRegion,animated: false)
        
    }
    
    private func beginLocationUpdates(locationManager:CLLocationManager){
        //Ahora podemos mostrar la localizacion ya que el usuario nos ha dado permiso
        mapView.showsUserLocation = true;
        //Dejamos que elija la exactitud que considere mejor
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //Vamos actualizando la localizacion
        locationManager.startUpdatingLocation()
        
    }
}


extension MapaViewController: CLLocationManagerDelegate{
    
    //Le dice al delegate que existen nuevos datos de localizacion
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Para depurar
        print("Did get latest location")
        
        guard let latestLocation = locations.first else {return}
        
        currentCoordinate = latestLocation.coordinate
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        currentCoordinate = latestLocation.coordinate
    }

    //Le dice al delegate si la autorizacion para ver la localizacion cambia
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("the status chaged")
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: manager)
        }
    }
}
