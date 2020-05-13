//
//  EditNoteViewController.swift
//  GuideUJA_UI
//
//  Created by Adrian Arboledas Fernandez on 07/05/2020.
//  Copyright © 2020 Adrian Arboledas Fernandez. All rights reserved.
//

import UIKit


protocol EditNoteDelegate {
    
    func updateNote(updatedTitle: String, updatedBody: String)
}


class EditNoteViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    var editNoteDelegate: EditNoteDelegate?
    var noteBody: String!
    
    
    //se encarga de inicializar el botón de guardar
    @IBAction func doneButtonTap(_ sender: Any) {
        
        self.bodyTextView.resignFirstResponder()
        
        self.doneButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        self.bodyTextView.delegate = self
        self.bodyTextView.text = noteBody
        self.bodyTextView.becomeFirstResponder()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.editNoteDelegate != nil {
            
            self.editNoteDelegate?.updateNote(updatedTitle: self.getNotesTitle(), updatedBody: self.bodyTextView.text)
            
                    }
    }
    
    //Si el texto ha sido modificado se habilita el botón de guardar
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.doneButton.isEnabled = true
    }
    
    //función encargada de obtener el nuevo título dado por el usuario al modificar la nota
    func getNotesTitle() -> String  {
        
        let components = self.bodyTextView.text.components(separatedBy: "\n")
        
        for components in components {
            if components.trimmingCharacters(in: CharacterSet.whitespaces).count > 0 {
                return components
            }
        }
        return self.navigationItem.title ?? ""
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
