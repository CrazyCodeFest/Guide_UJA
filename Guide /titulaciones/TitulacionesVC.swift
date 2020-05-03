//
//  TitulacionesVC.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 03/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class TitulacionesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let TitulacionesData = [
        ["Grado en Estudios Ingleses", "Grado en Filología Hispánica","Grado en Geografía e Historia", "Grado en Historia del Arte", "Grado en Historia del Arte",
         "Grado Interuniversitario en Arqueología", "Grado en Biología", "Grado en Ciencias Ambientales", "Grado en Química", "Doble Grado en enfermería y en Fisioterapia",
         "Grado en Enfermería", " Grado en Fisioterapeuta", "Grado en Psicología", "Doble Grado en Administración y Dirección de empresas y Grado en Derecho",
         "Doble Grado en Administración y dirección de empresas y Grado en Finanzas y Contabilidad", "Grado en administración y dirección de empresas", "Grado en Derecho",
         "Grado en Educación Infantil", "Grado en Educación primaria", "Grado en Educación social", "Grado en Estadística y empresas", "Grado en Finanzas  y Contabilidad",
          "Grado en Gestión y Administración pública", "Grado en Relaciones Laborales y Recursos Humanos", "Grado en Trabajo Social", "Grado en Turismo", "Doble Grado en Ingeniería civil y Grado en ingeniería de Tecnologías Mineras", "Doble Grado en ingeniería de recursos energéticos y Grado en ingeniería Química industrial", "Doble Grado en Tecnologías de Telecomunición y Grado en Ingeniría Telemática", "Doble Grado en ingeniería eléctrica y Grado en Ingeniería electrónica industrial", "Doble Grado en Ingeniería Eléctrica y Grado en Ingeniería Mecánica", "Doble Grado en Ingeniería Electrónica Industrial y Grado en Ingeniería Mecánica", "Doble Grado en Ingeniería Mecánica y Grado en Ingeniería en Organización Industrial", "Grado en Ingeniería Civil", "Grado en Ingeniería de Organización Industrial", "Grado en Ingeniería de Recursos Energéticos", "Grado en Ingeniería de Tecnologías de Telecomunicación", "Grado en Ingeniería de Tecnologías Mineras", "Grado en Ingeniería Eléctrica", "Grado en Ingeniería Electrónica Industrial", "Grado en Ingeniería Geomática y Topográfica","Grado en Ingeniería Informática", "Grado en Ingeniería Mecánica", "Grado en Ingeniería Química Industrial", "Grado en Ingeniería Telemática"],
        
        ["Doble Máster en Lengua Española y Literatura", "Máster Interuniversitario en Análisis Histórico del Mundo Actual", "Máster Interuniversitario en Enseñanza Bilingüe y Aprendizaje Integrado de Contenidos y Lenguas Extranjeras", "Máster Universitario en Estudios Avanzados en Patrimonio Cultural: Historia, Arte y Territorio", "Máster Universitario en Investigación y Educación Estética: Artes, Música y Diseño", "Máster Universitario en Online en English Studies", "Doble Máster en Análisis, Conservación y Restauración de Componentes Físicos y Bióticos de los Hábitats y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp. Biología y Geología)", "Doble Máster en Biotecnología y Biomedicina y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp. Biología y geología)","Doble Máster en Olivar y aceite de oliva (Esp. Elaiotecnia) y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp. Economía, empresa y comercio)", "Doble Máster Universitario en Matemáticas y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp: Matemáticas)", "Máster Interuniversitario en Química Aplicada", "Máster Universitario en Análisis, Conservación y Restauración de Componentes Físicos y Bióticos de los Hábitats","Máster Universitario en Biotecnología y Biomedicina", "Máster Universitario en Olivar y Aceite de Oliva"],
        
        ["Doctorado1", "Doctorado2", "Doctorado3"]
    
    ]
    
    var TitulacionIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
       
        let nib = UINib (nibName: "TitulacionesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TitulacionesCell")
    }
    
    func customInicio(TitulacionIndex: Int, title: String){
        self.TitulacionIndex = TitulacionIndex
        self .title = title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitulacionesData[TitulacionIndex].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitulacionesCell", for: indexPath) as!  TitulacionesCell
        
        cell.textLabel?.text = TitulacionesData[TitulacionIndex] [indexPath.row]
        return cell
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
