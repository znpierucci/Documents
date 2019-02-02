//
//  NewDocumentDetailViewController.swift
//  Documents
//
//  Created by Zachary Pierucci on 1/30/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import UIKit

class NewDocumentDetailViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var infoView: UITextView!
    
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let doc = document {
            nameField.text = doc.name
            infoView.text = doc.text
            title = doc.name
        } else {
            title = ""
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nameEdit(_ sender: Any) {
        title = nameField.text
    }
    
    
    @IBAction func saveDocument(_ sender: Any) {
        guard let name = nameField.text else {
            return
        }
        
        Documents.save(name: name, info: infoView.text)
        
        navigationController?.popViewController(animated: true)
    }
}
