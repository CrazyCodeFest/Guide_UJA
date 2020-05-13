//
//  DetailEdificiosViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 11/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class DetailEdificiosViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UITextView!
    
    
    //Variables a las que se le enviará la información para que aparezca en pantalla
    var sentData1: String!
    var sentData2: String!
    var sentData3: String!
    var sentData4: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Se asigna a la vista detalle los valores de la celda seleccionada
        self.navigationItem.title = sentData1

        detailImageView.image = UIImage(named: sentData2)
        detailTitle.text = sentData4
        detailDescription.text = sentData3
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
