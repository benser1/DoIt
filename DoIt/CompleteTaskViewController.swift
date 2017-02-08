//
//  CompleteTaskViewController.swift
//  DoIt
//
//  Created by Brigan Enser on 2/6/17.
//  Copyright © 2017 Brigan Enser. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (task?.important)! {
            taskLabel.text = "❗️\(task!.name!)"
        } else {
            taskLabel.text = task!.name!
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        context.delete(task!)
        navigationController!.popViewController(animated: true)
    }
    
}
