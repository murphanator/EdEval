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
   // var componentOfReadingCheckboxNumber:Int = 5
    //var textboxTitlesForCheckboxes:[String]
    
    var label:String
    var checkBoxes:[Bool]
    var checkBoxLabel:[String]
    var slider:Int              //may not need this due to the label changes w/ slider value
    var sliderLabel:String
    var comments:String
    
    
    //MARK: Initialization
   // init(componentOfReadingCheckboxNumber:Int, textboxTitlesForCheckboxes:[String]){
     //       self.componentOfReadingCheckboxNumber = componentOfReadingCheckboxNumber
       //     self.textboxTitlesForCheckboxes = textboxTitlesForCheckboxes
      
    init(label:String, checkBoxes:[Bool], checkBoxLabel:[String], slider:Int, sliderLabel:String, comments:String){
        self.label = label
        self.checkBoxes = checkBoxes
        self.checkBoxLabel = checkBoxLabel
        self.slider = slider
        self.sliderLabel = sliderLabel
        self.comments = comments
        
        
       //globalVariablesInstance.numberOfCheckboxes = componentOfReadingCheckboxNumber
       //globalVariablesInstance.textboxTitleArray = textboxTitlesForCheckboxes
      // * globalVariablesInstance.numberOfCheckboxes = 5
      //*  globalVariablesInstance.textboxTitleArray = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
        
     //  GlobalVariables1.init(numberOfCheckboxes: 5, textboxTitleArray: ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"])
 //      CheckboxControl.init(checkboxTotal: 5, arrayOfCheckboxTitles: ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"])
        

        
    }
   }
//var readingK6Instance = ReadingK6Data(componentOfReadingCheckboxNumber: 5, textboxTitlesForCheckboxes:["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"])
