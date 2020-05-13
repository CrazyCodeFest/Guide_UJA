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
    
    
    //Arrays con las imagenes del pageControl
    var images: [String] = ["A4","B2","D1", "C2"]
    var frame = CGRect (x:0, y:0, width:0, height:0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Inicializamos el numero de paginas del pageControl al tamaño del arrays de imagenes
        PageControl.numberOfPages = images.count
        
        
        //Bucle que recorre el vector imagenes, donde se añaden las imágenes y el scroll correspondiente
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
    
    
    //Función que muestra en que pagina nos encontramos a través de la elipsis
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        PageControl.currentPage = Int(pageNumber)
    }
    

}
