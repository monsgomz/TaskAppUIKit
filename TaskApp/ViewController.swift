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
		//Get all the current tasks
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
