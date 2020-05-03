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
    
    var Titulaciones = ["Grados", "Másteres", "Doctorados"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Titulaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitulacionesCell", for: indexPath)
        cell.textLabel?.text = Titulaciones[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let titulacionesVC = TitulacionesVC()
        titulacionesVC.customInicio(TitulacionIndex: indexPath.row, title: Titulaciones[indexPath.row])
        self.navigationController?.pushViewController(titulacionesVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
