//
//  Readingk6ViewController.swift
//  EdEval
//
//  Created by Capital High on 1/26/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class Readingk6ViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var checkboxLabel: UITextField!
   // @IBOutlet weak var readingCheckboxControl: CheckboxControl!
    @IBOutlet weak var checkboxComments: UITextField!
    @IBOutlet weak var readingCheckboxControl2: CheckboxControl2!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // self refers to the viewController because its referenced there...
        // So viewController is a delegate for the following textFields:
        
        checkboxLabel.delegate = self
        //ReadingCheckboxControl.checkButtons = self
        //ReadingCheckboxControl.checkTxtField.indexOf() = self
        checkboxComments.delegate = self
       //**** checkboxLabel.text = "Component of Reading"
       //**** globalVariablesInstance.numberOfCheckboxes = 5
       //**** globalVariablesInstance.textboxTitleArray = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
        
 
     //9999   readingCheckboxControl.checkboxTotal = 5
     //9999   readingCheckboxControl.arrayOfCheckboxTitles = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
        
        
        
        
        
     //   self.readingCheckboxControl2.arrayOfCheckboxTitles = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
     //   self.readingCheckboxControl2.checkboxTotal = 5

        readingCheckboxControl2.PassValues(1, arrayOfCheckboxTitles: ["test"])
       
        
        
        
        
        //****8 readingCheckboxControl.checkTxtField.count
        
        
       // globalVariablesInstance.numberOfCheckboxes = currentValue
            // Handle the text field’s user input through delegate callbacks.
                // self refers to the viewController because its referenced there...
                // So viewController is a delegate for the following textFields:
                //nameTextField.delegate = self

    }

   // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     //   if (segue.identifier == "sliderSegue") {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        checkboxLabel.text = "Component of Reading"
       //9999 globalVariablesInstance.numberOfCheckboxes = 5
       //9999 globalVariablesInstance.textboxTitleArray = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
        
     //9999   readingCheckboxControl.checkboxTotal = 5
     //9999   readingCheckboxControl.arrayOfCheckboxTitles = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
   
        
        readingCheckboxControl2.checkboxTotal = 5
        readingCheckboxControl2.arrayOfCheckboxTitles = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]
                
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
