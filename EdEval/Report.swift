//
//  Report.swift
//  EdEval
//
//  Created by Capital High on 1/23/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit
class Report: NSObject, NSCoding {
    
    //MARK: Properties
    var reportName: String
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("reports")
    
    // MARK: Types
    struct PropertyKey {
        static let reportNameKey = "reportName"

    }
    
    //MARK: Initialization
    init?(reportName: String){
        //Initialize stored properties
        self.reportName = reportName
        //Initialization fails if there is no report name
       /*if reportName.isEmpty {
         return nil
        }*/
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(reportName, forKey: PropertyKey.reportNameKey)

    }
    required convenience init?(coder aDecoder: NSCoder) {
        let reportName = aDecoder.decodeObject(forKey: PropertyKey.reportNameKey) as! String
        
        // Must call designated initializer.
        self.init(reportName: reportName)
    }

}
