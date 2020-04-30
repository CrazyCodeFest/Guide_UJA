//
//  inicioViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 24/04/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class inicioViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var Scrollpage: UIScrollView!
    @IBOutlet weak var PageControl: UIPageControl!
    
    var images: [String] = ["A4", "imgCesped","B3"]
    var frame = CGRect (x:0, y:0, width:0, height:0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PageControl.numberOfPages = images.count
        
        for index in 0..<images.count {
            frame.origin.x = Scrollpage.frame.size.width * CGFloat(index)
            frame.size = Scrollpage.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.image = UIImage(named: images[index])
            self.Scrollpage.addSubview(imgView)
        }
        Scrollpage.contentSize = CGSize(width: (Scrollpage.frame.size.width * CGFloat(images.count)), height: Scrollpage.frame.size.height)
        Scrollpage.delegate = self
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        PageControl.currentPage = Int(pageNumber)
    }
    

}
