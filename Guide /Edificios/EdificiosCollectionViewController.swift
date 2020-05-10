//
//  EdificiosCollectionViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 11/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EdificiosCell"

class EdificiosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var items = [[String:String]]()
    
    func loadPlist() -> [[String:String]]{
        
        let path = Bundle.main.path(forResource: "Edificios", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        
        self.items = loadPlist()
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let detail = segue.destination as! DetailEdificiosViewController
            
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell){
                
                let item = self.items[indexPath.row]
                
                detail.sentData1 = item["Name"]
                detail.sentData2 = item["Image"]
                detail.sentData3 = item["Description"]
            }
        }
    }
   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EdificiosCollectionViewCell
    
        // Configure the cell
        let item = self.items[indexPath.row]
        cell.cellImageView.image = UIImage(named: item["Image"]!)
    
        return cell
    }

    
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
