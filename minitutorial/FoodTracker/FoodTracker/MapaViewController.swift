//
//  MapaViewController.swift
//  FoodTracker
//
//  Created by Javier Aranda Izquierdo on 10/05/2020.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapaViewController: UIViewController {

    @IBOutlet weak var MapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Damos una localizacion con la longitud y latitud
        //let localizacion = CLLocation(latitude: 37.7874, longitude: -3.7769)
        //La distancia en radio que queremos visualizar
        //let radio: CLLocationDistance = 2000.0
        //Creamos una region con los datos anteriores
        //let region = MKCoordinateRegionMakeWithDistance(localizacion.coordinate, radio, radio)
        
        //A nuestro MapView le damos esa region
        //MapView.setRegion(region, animated: true)
        
        //Llamamos a la funcion para comprobar permisos y si es adecuado, mostrar la localizacion
        checkLocationAuthorization()
        
        //Indicamos que el delegate es el mismo
        MapView.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(action(gestureRecognize:)))
        MapView.addGestureRecognizer(tapGesture)
        
    }
    
    //Funcion para comprobar los tipos autorizacion que debemos tener 
    private func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorization()
        }
        else{
            //Mostrar una alerta al usuario para que active los servios de localizacion para nuestra App
        }
    }
    
    private func setUpLocationManager(){
        //Indicamos que el delegate es el mismo
        locationManager.delegate = self
        //Indicamos que elija la exactitud que crea la mejor
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuthorization(){
        //Compromos el estado de la autorizacion
        switch CLLocationManager.authorizationStatus(){
        
            //Autoriza solo para cuando la App se esta utilizando
            case.authorizedWhenInUse:
                MapView.showsUserLocation = true
                centerViewOnUserLocation()
                break
            //No autoriza a utilizar su ubicacion. Mostrar alerta indicando que hacer para dar permiso
            case.denied:
                break
            //Si el usuario no ha dado ningun permiso aun. Preguntamos al usuario
            case.notDetermined:
                locationManager.requestWhenInUseAuthorization()
            
        //Cuando el usuario no puede cambiar los permisos
            case.restricted:
                break
        
            //Autoriza tambien cuando la App esta en segundo plano
            case.authorizedAlways:
                break
            
        }
    }
    
    //Centramos el mapa en un radio determinado a partir de la localizacion de usuario
    private func centerViewOnUserLocation(){
        
        if let localizacion = locationManager.location?.coordinate{
            let region = MKCoordinateRegionMakeWithDistance(localizacion, 1000,1000)
        MapView.setRegion(region, animated: true)
        }
    }
    
    
    private func anotacion(gestureRecognize: UIGestureRecognizer){
        
        self.MapView.removeAnnotations(MapView.annotations)
        
        let touchpoint = gestureRecognize.location(in: MapView)
        let newCoords = MapView.convert(touchpoint, toCoordinateFrom: MapView)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoords
        
        MapView.addAnnotation(annotation)
    }
    


}

//Utilizamos este extension para declarar el delegate de nuestro mapa
extension MapaViewController: CLLocationManagerDelegate{
    
    //func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
    //    print("renderizando....")
    //}
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    
    }
    
    
    @objc func action(gestureRecognize: UIGestureRecognizer){
        let touchpoint = gestureRecognize.location(in: MapView)
        let newCoords = MapView.convert(touchpoint, toCoordinateFrom: MapView)
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoords
        
        MapView.addAnnotation(annotation)
    }
}

extension MapaViewController: MKMapViewDelegate{

func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        //Si la ubicacion del pin es la del usuario, no devolvemos nada
        if annotation is MKUserLocation{
            return nil
        }
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        
        
        let annotationID = "AnnotationID"
        var annotationView : MKAnnotationView?

        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationID){
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }else{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationID)
        }

            if let annotationView = annotationView{
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "pin")

            }
        return pin
        }
}
