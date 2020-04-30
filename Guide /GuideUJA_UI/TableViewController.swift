//
//  TableViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 24/04/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tipoTitulaciones = ["Grados", "Másteres", "Doctorados"]
    
    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    //numero  de celdas a mostrar
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tipoTitulaciones.count
    }

    
    //Contenido de las celdas
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let tipoTitulaciones = self.tipoTitulaciones[indexPath.row]
            cell.textLabel?.text = tipoTitulaciones
        
        
            
                    return cell
        }
        

      
}
