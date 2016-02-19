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
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("reports")
    
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
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(reportName, forKey: PropertyKey.reportNameKey)

    }
    required convenience init?(coder aDecoder: NSCoder) {
        let reportName = aDecoder.decodeObjectForKey(PropertyKey.reportNameKey) as! String
        
        // Must call designated initializer.
        self.init(reportName: reportName)
    }

}