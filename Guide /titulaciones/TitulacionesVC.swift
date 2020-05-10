//
//  TitulacionesVC.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 03/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class TitulacionesVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{

    @IBOutlet weak var tableView: UITableView!
   
    
    //Informacion de titulacines, 1 vector = grados, 2 vector = Másteres, 3 Vector = doctorados
    
    let TitulacionesData = [
        ["Grado en Estudios Ingleses", "Grado en Filología Hispánica","Grado en Geografía e Historia", "Grado en Historia del Arte", "Grado en Historia del Arte",
         "Grado Interuniversitario en Arqueología", "Grado en Biología", "Grado en Ciencias Ambientales", "Grado en Química", "Doble Grado en enfermería y en Fisioterapia",
         "Grado en Enfermería", " Grado en Fisioterapeuta", "Grado en Psicología", "Doble Grado en Administración y Dirección de empresas y Grado en Derecho",
         "Doble Grado en Administración y dirección de empresas y Grado en Finanzas y Contabilidad", "Grado en administración y dirección de empresas", "Grado en Derecho",
         "Grado en Educación Infantil", "Grado en Educación primaria", "Grado en Educación social", "Grado en Estadística y empresas", "Grado en Finanzas  y Contabilidad",
          "Grado en Gestión y Administración pública", "Grado en Relaciones Laborales y Recursos Humanos", "Grado en Trabajo Social", "Grado en Turismo", "Doble Grado en Ingeniería civil y Grado en ingeniería de Tecnologías Mineras", "Doble Grado en ingeniería de recursos energéticos y Grado en ingeniería Química industrial", "Doble Grado en Tecnologías de Telecomunición y Grado en Ingeniría Telemática", "Doble Grado en ingeniería eléctrica y Grado en Ingeniería electrónica industrial", "Doble Grado en Ingeniería Eléctrica y Grado en Ingeniería Mecánica", "Doble Grado en Ingeniería Electrónica Industrial y Grado en Ingeniería Mecánica", "Doble Grado en Ingeniería Mecánica y Grado en Ingeniería en Organización Industrial", "Grado en Ingeniería Civil", "Grado en Ingeniería de Organización Industrial", "Grado en Ingeniería de Recursos Energéticos", "Grado en Ingeniería de Tecnologías de Telecomunicación", "Grado en Ingeniería de Tecnologías Mineras", "Grado en Ingeniería Eléctrica", "Grado en Ingeniería Electrónica Industrial", "Grado en Ingeniería Geomática y Topográfica","Grado en Ingeniería Informática", "Grado en Ingeniería Mecánica", "Grado en Ingeniería Química Industrial", "Grado en Ingeniería Telemática"],
        
        ["Doble Máster en Lengua Española y Literatura", "Máster Interuniversitario en Análisis Histórico del Mundo Actual", "Máster Interuniversitario en Enseñanza Bilingüe y Aprendizaje Integrado de Contenidos y Lenguas Extranjeras", "Máster Universitario en Estudios Avanzados en Patrimonio Cultural: Historia, Arte y Territorio", "Máster Universitario en Investigación y Educación Estética: Artes, Música y Diseño", "Máster Universitario en Online en English Studies", "Doble Máster en Análisis, Conservación y Restauración de Componentes Físicos y Bióticos de los Hábitats y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp. Biología y Geología)", "Doble Máster en Biotecnología y Biomedicina y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp. Biología y geología)","Doble Máster en Olivar y aceite de oliva (Esp. Elaiotecnia) y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp. Economía, empresa y comercio)", "Doble Máster Universitario en Matemáticas y Máster en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas (Esp: Matemáticas)", "Máster Interuniversitario en Química Aplicada", "Máster Universitario en Análisis, Conservación y Restauración de Componentes Físicos y Bióticos de los Hábitats","Máster Universitario en Biotecnología y Biomedicina", "Máster Universitario en Olivar y Aceite de Oliva", "Doble Máster Universitario en Avances en Seguridad de los Alimentos y en Profesorado en ESO, Bachillerato, F.P. o Enseñanza de Idiomas", "Máster Interuniversitario en Intervención Asistida con Animales", " Máster Universitario en Avances en Seguridad de los Alimentos", "Máster Universitario en Enfermería de Cuidados Críticos, Urgencias y Emergencias", "Máster Universitario en Gerontología: Longevidad, Salud y Calidad", "Máster Universitario en Investigación en Ciencias de la Salud", "Máster Universitario en Psicología General Sanitaria", "Máster Interuniversitario en Economía y Desarrollo Territorial", "Máster Interuniversitario en Marketing y Comportamiento del Consumidor", "Máster Universitario en Abogacía", "Máster Universitario en Administración de Empresas", "Máster Universitario en Análisis Crítico de las Desigualdades de Género e Intervención Integral en Violencia de Género", "Máster Universitario en Dependencia e Igualdad en la Autonomía Personal", "Máster Universitario en Derecho Público y de la Administración Pública", "Máster Universitario en Dirección, Gestión y Emprendimiento en Centros y Servicios Sociosanitarios", "Máster Universitario en Investigación y Docencia en Ciencias de la Actividad Física y Salud", "Máster Universitario en Justicia Penal y Sistema Penitenciario", "Máster Universitario en Planificación y Gestión Sostenible del Turismo", "Máster Universitario en Prevención de Riesgos Laborales", "Máster Universitario en Profesorado de Educación Secundaria Obligatoria y Bachillerato, Formación Profesional y Enseñanza de Idiomas", "Máster Universitario en Psicología Positiva", "Doble Máster Universitario en Ingeniería Informática y Seguridad Informática", "Máster Interuniversitario en Ingeniería de Minas", "Máster Interuniversitario en Tecnología de los Sistemas de Energía Solar Fotovoltaica", "Máster Universitario en Energías Renovables", "Máster Universitario en Industria Conectada", "Máster Universitario en Ingeniería de los Materiales y Construcción Sostenible", "Máster Universitario en Ingeniería de Telecomunicación", "Máster Universitario en Ingeniería del Transporte Terrestre y Logística", "Máster Universitario en Ingeniería Geodésica y Geofísica Aplicada", "Máster Universitario en Ingeniería Geomática y Geoinformación", "Máster Universitario en Ingeniería Industrial", "Máster Universitario en Ingeniería Informática", "Máster Universitario en Ingeniería Mecatrónica", "Máster Universitario en Seguridad Informática", "Máster Universitario en Sostenibilidad y Eficiencia Energética en los Edificios y en la Industria", "Máster Universitario en Tecnologías Geoespaciales para la Gestión Inteligente del Territorio" ],
        
        ["Doctorado en Aceites de Oliva", "Doctorado en Avances en Ingeniería de Materiales y Energías Sostenibles", "Doctorado en Biología Molecular y Celular", "Doctorado en Ciencia y Tecnología de la Tierra y del Medio Ambiente", "Doctorado en Derecho", "Doctorado en Energías Renovables", "Doctorado en Innovación Didáctica y Formación de Profesorado", "Doctorado en Psicología", "Doctorado en Química", "Doctorado en Seguridad de los Alimentos", "Doctorado en Tecnologías de la Información y la Comunicación", "Doctorado Interuniversitario en Arqueología Espacial", "Doctorado Interuniversitario en Ciencias de la Salud", "Doctorado Interuniversitario en Ciencias Económicas, Empresariales y Jurídicas", "Doctorado Interuniversitario en Cuidados Integrales y Servicios de Salud", "Doctorado Interuniversitario en Estudios Migratorios ", "Doctorado Interuniversitario en Lenguas y Culturas", "Doctorado Interuniversitario en Matemáticas", "Doctorado Interuniversitario en Mecánica de Fluidos", "Doctorado Interuniversitario en Patrimonio"]
    
    ]
   
    @IBOutlet weak var searchBar: UISearchBar!
    var TitulacionIndex: Int!

    var filteredTitulation = [[String]] ()
    
  
    var isSearching = false
  
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
       
        let nib = UINib (nibName: "TitulacionesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TitulacionesCell")
        
        
        
    }
    
    
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredTitulation = [TitulacionesData[TitulacionIndex].filter({ $0.lowercased().prefix(searchText.count) == searchText.lowercased()})]
        
        
        isSearching = true
        
        tableView.reloadData()
    }
   
   
    
    //Función usada en TableViewController para conocer la selección de la fila
    func customInicio(TitulacionIndex: Int, title: String){
        self.TitulacionIndex = TitulacionIndex
        self.title = title
    }
    
    
    //Muestra tantas filas como elementos del vector
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filteredTitulation[0].count
        }else{
            return TitulacionesData[TitulacionIndex].count
        }
      
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitulacionesCell", for: indexPath) as!  TitulacionesCell
        cell.textLabel?.numberOfLines = 0
        if isSearching{
            cell.textLabel?.text = filteredTitulation[0][indexPath.row]
        }else{
            cell.textLabel?.text = TitulacionesData[TitulacionIndex] [indexPath.row]
        }
        
        
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


