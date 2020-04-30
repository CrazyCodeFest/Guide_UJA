//
//  CollectionViewCell.swift
//  GuideUJA_UI
//
//  Created by Javier Aranda Izquierdo on 24/04/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //Label del nombre de cada edificio
    @IBOutlet private weak var NombreEdificiosLabel: UILabel!
    
    //Da el nombre pasado por parametro al  texto del Label de NombreEdificioLabel
    func configuracion (with nombreDeEdificio: String){
        NombreEdificiosLabel.text = nombreDeEdificio
    }
    
    
}

