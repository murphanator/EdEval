//
//  ReadingK6Data.swift
//  EdEval
//
//  Created by Capital High on 1/30/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit
class ReadingK6Data {
    //MARK: Properties
    var componentOfReadingCheckboxNumber:Int = 5
    var textboxTitlesForCheckboxes:[String]
    
    //MARK: Initialization
    init(componentOfReadingCheckboxNumber:Int, textboxTitlesForCheckboxes:[String]){
            self.componentOfReadingCheckboxNumber = componentOfReadingCheckboxNumber
            self.textboxTitlesForCheckboxes = textboxTitlesForCheckboxes
        
       //globalVariablesInstance.numberOfCheckboxes = componentOfReadingCheckboxNumber
       //globalVariablesInstance.textboxTitleArray = textboxTitlesForCheckboxes
        globalVariablesInstance.numberOfCheckboxes = 5
        globalVariablesInstance.textboxTitleArray = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
        
     //  GlobalVariables1.init(numberOfCheckboxes: 5, textboxTitleArray: ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"])
 //      CheckboxControl.init(checkboxTotal: 5, arrayOfCheckboxTitles: ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"])
        

        
    }
    
}
var readingK6Instance = ReadingK6Data(componentOfReadingCheckboxNumber: 5, textboxTitlesForCheckboxes:["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"])
