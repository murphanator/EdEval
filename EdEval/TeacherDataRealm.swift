//
//  TeacherDataRealm.swift
//  EdEval
//
//  Created by Capital High on 6/11/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import Foundation
import RealmSwift

class TeacherDataRealm: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    
    //class Teacher: Object {
        dynamic var teacherName = ""
        dynamic var schoolName = ""
        dynamic var subjectName = ""
        dynamic var gradeLevel = ""
    //}
    
  }
