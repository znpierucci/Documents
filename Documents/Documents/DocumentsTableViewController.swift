//
//  DocumentsTableViewController.swift
//  Documents
//
//  Created by Zachary Pierucci on 1/30/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import UIKit

class DocumentsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var documentsTableView: UITableView!
    
    var documents = [Document]()
    
    var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        
        
        documentsTableView.dataSource = self
        documentsTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? CustomTableViewCell {
            let doc = documents[indexPath.row]
            let sizeHolder = String(doc.size)
            cell.nameLabel.text = doc.name
            cell.sizeLabel.text = "Size: " + sizeHolder + " bytes"
            cell.dateLabel.text = "Modified: " + dateFormatter.string(from: doc.date)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editSegue" {
            if let destination = segue.destination as? NewDocumentDetailViewController,
                let row = documentsTableView.indexPathForSelectedRow?.row {
                destination.document = documents[row]
            }
        }
    }

}

