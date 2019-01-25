//
//  WalkThruViewController.swift
//  EdEval
//
//  Created by Capital High on 10/12/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit
import RealmSwift
//@interface MyViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
class WalkThruViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var schoolTextField: UITextField!
    
    @IBOutlet weak var subjectTextField: UITextField!
    
    @IBOutlet weak var gradeTextField: UITextField!
    
    @IBOutlet weak var walkthroughPageControl: UIPageControl!
    
    //Test the textField...
    var myTextField = ""
    
    var newTeacher = TeacherDataRealm()

    
    
    
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the Keyboard. Resign first responder status
        textField.resignFirstResponder()
        return true
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
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
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    //MARK: Actions
    
    @IBAction func startWalkThroughButton(_ sender: UIButton) {
        //user clicked start button...do something with the data entered...like display on next window
        print(nameTextField.text!)          // ! tells compiler value can't be nil so not an optional value..or something like that...Unwraps an optional value.
        print(schoolTextField.text)
        print(subjectTextField.text)
        print(gradeTextField.text)
        
        newTeacher.teacherName = nameTextField.text!
        newTeacher.schoolName = schoolTextField.text!
        newTeacher.subjectName = subjectTextField.text!
        newTeacher.gradeLevel = gradeTextField.text!
        
       let realm = try! Realm()
    
        try! realm.write {
            realm.add(newTeacher)   //Add to Database
        }
    }
    @IBAction func setPageController(_ sender: UIPageControl) {
        
    }

}

