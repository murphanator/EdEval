//
//  TeacherData.swift
//  EdEval
//
//  Created by Capital High on 10/16/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit
class TeacherData {
    // MARK: Properties
    
    var teacherName: String
    var schoolName: String
    var subjectName: String
    var gradeLevel: String
    
    //var photo: UIImage?
    //var rating: Int
    
    // MARK: Initialization
    
    init?(teacherName: String, schoolName: String, subjectName: String, gradeLevel: String) {
    
        // Initialize stored properties.
        self.teacherName = teacherName
        self.schoolName = schoolName
        self.subjectName = subjectName
        self.gradeLevel = gradeLevel
        
        // Initialization should fail if there is no teacher name
        if teacherName.isEmpty {
            return nil
        }
        
    }
}
