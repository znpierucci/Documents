//
//  Documents.swift
//  Documents
//
//  Created by Zachary Pierucci on 1/31/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import Foundation

class Documents {
    
    class func getDocument() -> [Document] {
        var documents = [Document]()
        
        let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        if let urls = try? FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: nil) {
            for url in urls {
                let name = url.lastPathComponent
                let text = url.lastPathComponent
                if let attributes = try? FileManager.default.attributesOfItem(atPath: url.path),
                    let size = attributes[FileAttributeKey.size] as? Int,
                    let date = attributes[FileAttributeKey.modificationDate] as? Date {
                    documents.append(Document(url: url, name: name, size: size, date: date, text: text ))
                }
            }
        }
        return documents
    }
    
    class func save(name: String, info: String) {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let url = documentsURL.appendingPathComponent(name)
        
        try? info.write(to: url, atomically: true, encoding: .utf8)
    }
    
    class func delete(url: URL) {
        try? FileManager.default.removeItem(at: url)
    }
    
}
