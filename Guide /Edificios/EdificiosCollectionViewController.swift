//
//  EdificiosCollectionViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 11/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

//variable que almacena el identificador de las celdas
private let reuseIdentifier = "EdificiosCell"

class EdificiosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    var items = [[String:String]]()
    
    //función encargada de cargar a partir de "Edificios.plist", que es donde se encuentra toda la información almacenada
    func loadPlist() -> [[String:String]]{
        
        let path = Bundle.main.path(forResource: "Edificios", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.items = loadPlist()
        
    }

    
    // MARK: - Navigation

   //función encargada de detectar que celda se ha pulsado y por tanto mandar su información al "DetailEdificiosViewController"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detail = segue.destination as! DetailEdificiosViewController
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell){
                
                let item = self.items[indexPath.row]
                //Manda a "DetailEdificiosViewController" los datos correspondientes a la celda seleccionada
                detail.sentData1 = item["Name"]
                detail.sentData2 = item["Image"]
                detail.sentData3 = item["Description"]
                detail.sentData4 = item["LongName"]
            }
        }
    }
   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EdificiosCollectionViewCell
    
        //Asignamos a la celda la imagen de su edificio correspondiente
        let item = self.items[indexPath.row]
        cell.cellImageView.image = UIImage(named: item["Image"]!)
        cell.EdifName.text = item["Name"]
    
        return cell
    }

    //Función encargada de ajustar el tamaño de las celdas del CollectionView, Para hacerlo compatible con los demas dispositivos
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        let screanSize : CGRect = UIScreen.main.bounds
        var widthCell = 0
        var heightCell = 0
        
      
      
       
        //iphone x
        if screanSize.width == 375 {
            widthCell = 172
            heightCell = 125
        }
        
        
        //iphone 6+,7+,8+
        if screanSize.width == 414 {
            widthCell = 191
            heightCell = 125
        }
        //iphone 5,5s,5c,SE
       if screanSize.width == 320{
            widthCell = 144
            heightCell = 125
        }
        
        return CGSize(width: widthCell, height: heightCell)
    }
    
    
    
}
