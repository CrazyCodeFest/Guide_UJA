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
    
    // Nuestro MapView
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()
    }
    
    private func configureLocationServices(){
         locationManager.delegate = self
    
        //Pedimos la localizacion
        if CLLocationManager.authorizationStatus() == .notDetermined{
            //En nuestro caso, elegimos la autorizacion para siempre
            locationManager.requestAlwaysAuthorization()
        }else{
            
            
        }
    }
}


extension MapaViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }

    //El usuario tiene que dar permiso para ver la localizacion para actualizarla
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
