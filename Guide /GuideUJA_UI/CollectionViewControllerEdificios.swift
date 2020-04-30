//
//  CollectionViewControllerEdificios.swift
//  GuideUJA_UI
//
//  Created by Javier Aranda Izquierdo on 24/04/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class CollectionViewControllerEdificios: UICollectionViewController {
    
    //El nombre de nuestros edificios
    let edificios: [String]=["A4", "A3", "A2", "A1", "B5", "B4", "B3", "B2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Cantidad de edificios
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //Devolvemos el numero de edificios que tenemos
        return edificios.count;
    }
    
    //Con esto vamos a devolver un cell para cada edificio que tengamos
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if let edificioCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell {
            
            edificioCell.configuracion(with: edificios[indexPath.row])
            
            cell = edificioCell
        }
        
        return cell
    }
}

