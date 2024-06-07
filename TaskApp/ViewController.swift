//
//  ViewController.swift
//  TaskApp
//
//  Created by Montserrat Gomez on 2024-06-06.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var tableView: UITableView!
	var tasks = [String]()
	

	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.title = "Tasks"
		tableView.delegate = self
		tableView.dataSource = self
		
		//Setup de user defaults para guardar la informacion en el dispositivo
		if !UserDefaults().bool(forKey: "setup"){
			UserDefaults().set(true, forKey: "setup")
			UserDefaults().set(0, forKey: "count")
		}
		
		//Get all the current saved tasks
		updateTasks()
		
	}

	func updateTasks(){
		
		tasks.removeAll()
		
		guard	let count = UserDefaults().value(forKey: "count") as? Int else{
			return
		}
		
		for x in 0..<count {
			
			if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
				tasks.append(task)
			}
		}
		
		tableView.reloadData() //para que se muestre el valor
		
		
	}
	
	/// Funcion para boton clic Add, agregar task
	/// - Parameter sender:
	@IBAction func didTapAdd(_ sender: Any) {
		
		let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController //Se crea instancia de el otro view controller y se inicializa
		vc.title = "New Task"
		vc.update = {
			DispatchQueue.main.async {
				self.updateTasks()
			}
		}
		navigationController?.pushViewController(vc, animated: true) //pone el view controller en la pila de navegacion
		
	}
	
}

//Para interacciones con datos en la tabla, clic, re ordenamiento de celdas ..
extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //para manejar los clic en la tabla
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

extension ViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tasks.count
	}
	
		//esta se llama para todas las celdas que existan
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = tasks[indexPath.row]
		
		return cell
	}
	
}
