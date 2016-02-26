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
   
    @IBOutlet weak var check0: SCheckBox!
    @IBOutlet weak var check1: SCheckBox!
    @IBOutlet weak var check2: SCheckBox!
    @IBOutlet weak var check3: SCheckBox!
    @IBOutlet weak var check4: SCheckBox!
    
    @IBOutlet weak var checkboxComments: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // self refers to the viewController because its referenced there...
        // So viewController is a delegate for the following textFields:
        
        checkboxLabel.delegate = self
        checkboxComments.delegate = self
        
        checkboxLabel.text = "Component of Reading"
        
        self.check0.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check0.textLabel.text = "Phonomic Awareness"
        self.check0.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check1.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check1.textLabel.text = "Phonics"
        self.check1.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check2.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check2.textLabel.text = "Vocabulary"
        self.check2.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check3.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check3.textLabel.text = "Fluency"
        self.check3.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check4.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check4.textLabel.text = "Comprehension"
        self.check4.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        
    //    self.newCheck.checkboxTotal = 5
    //    self.newCheck.arrayOfCheckboxTitles = ["Phonemic awareness","Phonics","Vocabulary","Fluency","Comprehension"]       
        
       // globalVariablesInstance.numberOfCheckboxes = currentValue
            // Handle the text field’s user input through delegate callbacks.
                // self refers to the viewController because its referenced there...
                // So viewController is a delegate for the following textFields:
                //nameTextField.delegate = self

    }
    
    func tapCheck(checkBox: SCheckBox!){
        print("\(checkBox.checked)")
    }

    
    
    

   // override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     //   if (segue.identifier == "sliderSegue") {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        
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
