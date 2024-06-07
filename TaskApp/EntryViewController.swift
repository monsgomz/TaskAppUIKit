//
//  EntryViewController.swift
//  TaskApp
//
//  Created by Montserrat Gomez on 2024-06-06.
//
//Donde el usuario puede añadir información

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet var field: UITextField!
	
	var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

		field.delegate = self
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask)) //selector es para llamar a una funcion
    }
    
	//Funcion cuando la persona da return en el teclado
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		saveTask()
		
		return true
	}
	
	@IBAction func saveTask() {
		
		guard let text = field.text, !text.isEmpty else {
			return
		} //por si esta vacio el campo
		
		guard var count = UserDefaults().value(forKey: "count") as? Int else { return  }
		
		let newCount = count + 1
		
		UserDefaults().set(newCount, forKey: "count")
		UserDefaults().set(text, forKey: "task_\(newCount)")
		
		update?()
		
		navigationController?.popViewController(animated: true) //se cambia de navegacion
		
	}
   
		
}
