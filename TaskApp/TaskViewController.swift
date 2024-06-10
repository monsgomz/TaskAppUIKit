//
//  TaskViewController.swift
//  TaskApp
//
//  Created by Montserrat Gomez on 2024-06-06.
//
//Mostrar informacion del Task

import UIKit

class TaskViewController: UIViewController {
	
	@IBOutlet var label: UILabel!
	
	var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()
		
		label.text = task
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "delete", style: .done, target: self, action: #selector(deletTask))
    }
	
	@objc func deletTask() {
		
//		let newCount = count - 1
//		
//		UserDefaults().setValue(newCount, forKey: "count")
//		UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
		
	}
    


}
