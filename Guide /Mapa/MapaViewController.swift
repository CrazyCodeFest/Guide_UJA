//
//  MapaViewController.swift
//  GuideUJA_UI
//
//  Created by Javier Aranda Izquierdo on 05/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit
import MapKit

////Clase para crear una anotacion
//final class anotacion: NSObject,MKAnnotation{
//    var coordinate: CLLocationCoordinate2D
//
//
////    //Coordenadas de una anotacion
////    var coordenadas: CLLocationCoordinate2D
////    //Titulo de una anotacion
////    var titulo: String
////
////
////
////    init(coordenadas: CLLocationCoordinate2D, titulo: String){
////        self.coordenadas = coordenadas
////        self.titulo = titulo
////
////        super.init()
////    }
//}

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
        crearAnotaciones()
        
        
    }
    
    private func configureLocationServices(){
        
        //El delegate de locationManager lo encontramos en este doc
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
        let zoomRegion = MKCoordinateRegion(center: coordinate,latitudinalMeters: 500,longitudinalMeters: 500)
        
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
    
    private func crearAnotaciones(){
        
        //Anotacion edificio A1
        let A1 = MKPointAnnotation()
        A1.coordinate = CLLocationCoordinate2D(latitude: 37.7884, longitude: -3.7792)
        A1.title = "A1"
        

        let A2 = MKPointAnnotation()
        A2.coordinate = CLLocationCoordinate2D(latitude: 37.7879, longitude: -3.7785)
        A2.title = "A2"

        let A3 = MKPointAnnotation()
        A3.coordinate = CLLocationCoordinate2D(latitude: 37.7873, longitude: -3.7777)
        A3.title = "A3"

        let A4 =  MKPointAnnotation()
        A4.coordinate = CLLocationCoordinate2D(latitude: 37.7869, longitude: -3.7771)
        A4.title = "A4"

        let B1 = MKPointAnnotation()
        B1.coordinate = CLLocationCoordinate2D(latitude: 37.7897, longitude: 3.7798)
        B1.title = "B1"

        let B2 = MKPointAnnotation()
        B2.coordinate = CLLocationCoordinate2D(latitude: 37.7888, longitude: -3.7788)
        B2.title = "B2"
        
        let B3 = MKPointAnnotation()
        B3.coordinate = CLLocationCoordinate2D(latitude: 37.7884, longitude: -3.7780)
        B3.title = "B3"
        
        let B4 = MKPointAnnotation()
        B4.coordinate = CLLocationCoordinate2D(latitude: 37.7879, longitude: -3.7772)
        B4.title = "B4"
        
        let B5 = MKPointAnnotation()
        B5.coordinate = CLLocationCoordinate2D(latitude: 37.7875, longitude: -3.7765)
        B5.title = "B5"
        
        let C1 = MKPointAnnotation()
        C1.coordinate = CLLocationCoordinate2D(latitude: 37.7893, longitude: -3.7782)
        C1.title = "C1"
        
        let C2 = MKPointAnnotation()
        C2.coordinate = CLLocationCoordinate2D(latitude: 37.7888, longitude: -3.7773)
        C2.title = "C2"
        
        let C3 = MKPointAnnotation()
        C3.coordinate = CLLocationCoordinate2D(latitude: 37.7884, longitude: -3.7767)
        C3.title = "C3"
        
        let C4 = MKPointAnnotation()
        C4.coordinate = CLLocationCoordinate2D(latitude: 37.7879, longitude: -3.7761)
        C4.title = "C4"
        
        let C5 = MKPointAnnotation()
        C5.coordinate = CLLocationCoordinate2D(latitude: 37.7877, longitude: -3.7749)
        C5.title = "C5"
        
        let C6 = MKPointAnnotation()
        C6.coordinate = CLLocationCoordinate2D(latitude: 37.7871, longitude: -3.7741)
        C6.title = "C6"
        
        let D1 = MKPointAnnotation()
        D1.coordinate = CLLocationCoordinate2D(latitude: 37.7899, longitude: -3.7781)
        D1.title = "D1"
        
        let D2 = MKPointAnnotation()
        D2.coordinate = CLLocationCoordinate2D(latitude: 37.7894, longitude: -3.7771)
        D2.title = "D2"
        
        let D3 = MKPointAnnotation()
        D3.coordinate = CLLocationCoordinate2D(latitude: 37.7888, longitude: -3.7762)
        D3.title = "D3"
        
        mapView.addAnnotation(A1)
        mapView.addAnnotation(A2)
        mapView.addAnnotation(A3)
        mapView.addAnnotation(A4)
        mapView.addAnnotation(B1)
        mapView.addAnnotation(B2)
        mapView.addAnnotation(B3)
        mapView.addAnnotation(B4)
        mapView.addAnnotation(B5)
        mapView.addAnnotation(C1)
        mapView.addAnnotation(C2)
        mapView.addAnnotation(C3)
        mapView.addAnnotation(C4)
        mapView.addAnnotation(C5)
        mapView.addAnnotation(C6)
        mapView.addAnnotation(D1)
        mapView.addAnnotation(D2)
        mapView.addAnnotation(D3)
    }
    
    
    private func aletarDistancia(currentLocation:CLLocationCoordinate2D)-> Double {
        
        let centroCampus = CLLocationCoordinate2D(latitude: 37.7884,longitude: -3.7773)
        
        let point1: MKMapPoint = MKMapPoint(centroCampus);
        let point2: MKMapPoint = MKMapPoint(currentLocation);
        
        let distancia: CLLocationDistance = point1.distance(to:point2)
        
        
        print(distancia)
        
        return distancia
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Aleta", message:
            "No estas en el Campus de la UJA. Desplazate hacia allí para utilizar el mapa", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


extension MapaViewController: CLLocationManagerDelegate{
    
    //Le dice al delegate que existen nuevos datos de localizacion
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //Para depurar
        print("Did get latest location")
        
        guard let latestLocation = locations.first else {return}
        
        //Actualizamos la posicion en caso de que haya cambiado
        currentCoordinate = latestLocation.coordinate
        //Llamamos a la funcion para hacer zoom
        zoomToLatestLocation(with: latestLocation.coordinate)
        
        if(aletarDistancia(currentLocation: manager.location!.coordinate) > 500.0){
            showAlert()
        }
        
    }

    //Le dice al delegate si la autorizacion para ver la localizacion cambia
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("the status chaged")
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationManager: manager)
        }
    }
}

extension MapaViewController: MKMapViewDelegate{
    
}
