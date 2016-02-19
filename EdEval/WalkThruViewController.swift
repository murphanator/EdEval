//
//  WalkThruViewController.swift
//  EdEval
//
//  Created by Capital High on 10/12/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit

class WalkThruViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var schoolTextField: UITextField!
    
    @IBOutlet weak var subjectTextField: UITextField!
    
    @IBOutlet weak var gradeTextField: UITextField!
    
    @IBOutlet weak var walkthroughPageControl: UIPageControl!
    
    //Test the textField...
    var myTextField = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // self refers to the viewController because its referenced there... 
        // So viewController is a delegate for the following textFields:
        nameTextField.delegate = self
        schoolTextField.delegate = self
        subjectTextField.delegate = self
        gradeTextField.delegate = self
       // walkthroughPageControl.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Hide the Keyboard. Resign first responder status
        textField.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(textField: UITextField) {
        //save the textField info
         //mealNameLabel.text = textField.text
        //String; myTextField
        myTextField = textField.text!
        
        //print(myTextField)  //works store as an array. If they leave textfield blank it saves as blank
                            // or pass textField.text back to calling program associated with teacher, school, etc.
        //print(nameTextField.text)
        //print(schoolTextField.text)
        //print(subjectTextField)
        //print(gradeTextField.text)
        
        
    }
    
    //MARK: Navigation
    
    @IBAction func back(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    //MARK: Actions
    
    @IBAction func startWalkThroughButton(sender: UIButton) {
        //user clicked start button...do something with the data entered...like display on next window
        print(nameTextField.text!)          // ! tells compiler value can't be nil so not an optional value..or something like that...Unwraps an optional value.
        print(schoolTextField.text)
        print(subjectTextField.text)
        print(gradeTextField.text)
        
    }
    @IBAction func setPageController(sender: UIPageControl) {
        
    }

}

