//
//  TableViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 03/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    //Vector con los 3 tipos de opciones de titulaciones
    var Titulaciones = ["Grados", "Másteres", "Doctorados"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Quita las lineas separadoras del Table view que no sean necesarioas
        tableView.tableFooterView = UIView()
        
        
        tableView.dataSource = self
        
        
    }
    
    //Función que devuelve el númeor de filas según el tamaño del vector
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Titulaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitulacionesCell", for: indexPath)
        //Redimensiona la celda para que el texto no se entrecorte
        cell.textLabel?.numberOfLines = 0
        //Obtine la información de la clase Titulaciones, para mostrarlo en pantalla.
        cell.textLabel?.text = Titulaciones[indexPath.row]
        
        
        
        return cell
    }

    /*
     *Está función detecta que tipo de titulación se ha seleccionado, y te lleva a la información de la misma
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let titulacionesVC = TitulacionesVC()
        titulacionesVC.customInicio(TitulacionIndex: indexPath.row, title: Titulaciones[indexPath.row])
        self.navigationController?.pushViewController(titulacionesVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}



