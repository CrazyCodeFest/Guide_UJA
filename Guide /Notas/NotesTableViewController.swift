//
//  NotesTableViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 07/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController, EditNoteDelegate {

    @IBAction func addNoteButton(_ sender: UIBarButtonItem) {
        
        //Un array con un string key y un string value
        //claves = "title", "body"
        let note = ["title:": "", "body": ""]
        notes.insert(note, at: 0)
        self.tableView.reloadData()
        self.selectedIndex = 0
        performSegue(withIdentifier: "ShowEditScreenSegue", sender: nil)
    }
    
    
    var notes = [[String: String]] ()
    var selectedIndex = -1
    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
        super.viewDidLoad()
        
        self.readNotes()
        
        
        
    }
    
    //Esta función es la encargada de de guardar todas las notas creadas
    func saveNotes() {
        
        //Para guardar hemos usado UserDefault, ya que es útil para guardar datos pequeños como lo son las notas
        UserDefaults.standard.set(self.notes, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
    
    //Función encargada de la lectura de las notas ya creadas
    func readNotes() {
        //buscamos la nota dentro del array que hemos almacenado en UserDefault
        if let newNotes = UserDefaults.standard.array(forKey: "notes") as? [[String:String]] {
           self.notes = newNotes
        }
    }

    // MARK: - Table view data source

    
    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //Devuelve el numero de filas, según el tamaño del vector
        return self.notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath)
        
        
        //Esto hace que en la vista principal solo se muestre el título de la nota
        cell.textLabel?.text = self.notes[indexPath.row]["title"]
        
        return cell
    }
    

    //Función encargada de la navegación entre las vistas, al seleccionar una nota te llevará a su vista completa
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedIndex = indexPath.row
        //identificador del segue entre la lista de notas y las notas
         performSegue(withIdentifier: "ShowEditScreenSegue", sender: nil)
        
    }
    
    //Esta función se encarga de habilitar el borrado de la nota
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //borra la nota seleccionada
            self.notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //vuelve a llamar a la función guardar, para actualizar el contenido del vector
            self.saveNotes()
        }
    }
    
    
    //Función encargada de la edición de las notas
    func updateNote(updatedTitle: String, updatedBody: String) {
        //Se asigna nuevo título y descripción
        self.notes[selectedIndex]["title"] = updatedTitle
        self.notes[selectedIndex]["body"] = updatedBody
        //recarga la tabla para actualizar a los nuevos valores
        self.tableView.reloadData()
        //realiza el cambio en el vector de la modificación
        self.saveNotes()
    }
    
    //función que modifica la vista segun los elementos de la nota seleccionada, es decir quien muestra los elementos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVc = segue.destination as? EditNoteViewController
        
        destinationVc?.title = self.notes[selectedIndex]["title"]
        destinationVc?.noteBody = self.notes[selectedIndex]["body"]
        destinationVc?.editNoteDelegate = self
        
        
    }
 
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
