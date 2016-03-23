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
    
    @IBOutlet weak var readingK6ScrollView: UIScrollView!
    @IBOutlet weak var componentOfReadingLabel: UILabel!
    @IBOutlet weak var check0: SCheckBox!
    @IBOutlet weak var check1: SCheckBox!
    @IBOutlet weak var check2: SCheckBox!
    @IBOutlet weak var check3: SCheckBox!
    @IBOutlet weak var check4: SCheckBox!
    @IBOutlet weak var checkboxComments: UITextField!
    
    @IBOutlet weak var timeInTextLabel: UILabel!
    @IBOutlet weak var timeInTextCheck: SCheckBox! 
    @IBOutlet weak var timeInTextSlider: UISlider!
    @IBOutlet weak var timeInTextSliderLabel: UILabel!
    
    @IBOutlet weak var writingInResponsesToReadingLabel: UILabel!
    @IBOutlet weak var writingInResponsesToReadingCheck: SCheckBox!
    @IBOutlet weak var writingInResponsesToReadingSlider: UISlider!
    @IBOutlet weak var writingInResponsesToReadingSliderLabel: UILabel!
    
    @IBOutlet weak var checksForUnderstandingLabel: UILabel!
    @IBOutlet weak var checksForUnderstandingCheck: SCheckBox!
    @IBOutlet weak var checksForUnderstandingSlider: UISlider!
    @IBOutlet weak var checksForUnderstandingSliderLabel: UILabel!
    
    @IBOutlet weak var engagementLabel: UILabel!
    @IBOutlet weak var engagementSlider: UISlider!
    @IBOutlet weak var engagementSliderLabel: UILabel!

    @IBOutlet weak var complianceLabel: UILabel!
    @IBOutlet weak var complianceSlider: UISlider!
    @IBOutlet weak var complianceSliderLabel: UILabel!

    @IBOutlet weak var positiveReinforcementLabel: UILabel!
    @IBOutlet weak var positiveReinforcementSlider: UISlider!
    @IBOutlet weak var positiveReinforcementSliderLabel: UILabel!
    
    @IBOutlet weak var guidedPracticeLabel: UILabel!
    @IBOutlet weak var guidedPracticeCheck0: SCheckBox!
    @IBOutlet weak var guidedPracticeCheck1: SCheckBox!
    @IBOutlet weak var guidedPracticeCheck2: SCheckBox!
    
    @IBOutlet weak var responsesLabel: UILabel!
    @IBOutlet weak var responsesCheck0: SCheckBox!
    @IBOutlet weak var responsesCheck1: SCheckBox!
    @IBOutlet weak var responsesCheck2: SCheckBox!
    @IBOutlet weak var responsesCheck3: SCheckBox!
    
    @IBOutlet weak var feedbackToTeachers: UITextField!
    
    
    var timeInTextSliderValue = 2
    @IBAction func timeInTextSliderValueChanged(sender: AnyObject) {
        timeInTextSliderValue = Int(timeInTextSlider.value)
        if timeInTextSliderValue == 1{
            timeInTextSliderLabel.text = "Less than 1 minute"
        }
        if timeInTextSliderValue == 2{
            timeInTextSliderLabel.text = "1 to 2 minutes"
        }
        if timeInTextSliderValue == 3 {
            timeInTextSliderLabel.text = "More than 2 minutes"
        }
 
    }
    
    
    var writingInResponsesToReadingValue = 3
    @IBAction func writingInResponsesToReadingSliderValueChanged(sender: AnyObject) {
        writingInResponsesToReadingValue = Int(writingInResponsesToReadingSlider.value)
        if writingInResponsesToReadingValue == 1{
            writingInResponsesToReadingSliderLabel.text = "Words"
        }
        if writingInResponsesToReadingValue == 2{
            writingInResponsesToReadingSliderLabel.text = "Sentence"
        }
        if writingInResponsesToReadingValue == 3{
            writingInResponsesToReadingSliderLabel.text = "Multiple Sentences"
        }
        if writingInResponsesToReadingValue == 4{
            writingInResponsesToReadingSliderLabel.text = "Paragraphs"
        }
        if writingInResponsesToReadingValue == 5{
            writingInResponsesToReadingSliderLabel.text = "Multiple Paragraphs"
        }

    }
 
    var checksForUnderstandingValue = 1
    @IBAction func checksForUnderstandingSliderValueChanged(sender: AnyObject) {
        checksForUnderstandingValue = Int(checksForUnderstandingSlider.value)
        if checksForUnderstandingValue == 1 {
            checksForUnderstandingSliderLabel.text = "1"
        }
        if checksForUnderstandingValue == 2 {
            checksForUnderstandingSliderLabel.text = "2"
        }
        if checksForUnderstandingValue == 3 {
            checksForUnderstandingSliderLabel.text = "3"
        }
        if checksForUnderstandingValue == 4 {
            checksForUnderstandingSliderLabel.text = "4"
        }
    }
    
    var engagementValue = 3
    @IBAction func engagementSliderValueChanged(sender: AnyObject) {
        engagementValue = Int(engagementSlider.value)
        if engagementValue == 1 {
            engagementSliderLabel.text = "Less than 50%"
        }
        if engagementValue == 2 {
            engagementSliderLabel.text = "50-70%"
        }
        if engagementValue == 3 {
            engagementSliderLabel.text = "70-80%"
        }
        if engagementValue == 4 {
            engagementSliderLabel.text = "80-90%"
        }
        if engagementValue == 5 {
            engagementSliderLabel.text = "90-100%"
        }
    }
    
    var complianceValue = 3
    @IBAction func complianceSliderValueChanged(sender: AnyObject) {
        complianceValue = Int(complianceSlider.value)
        if complianceValue == 1 {
            complianceSliderLabel.text = "Less than 50%"
        }
        if complianceValue == 2 {
            complianceSliderLabel.text = "50-70%"
        }
        if complianceValue == 3 {
            complianceSliderLabel.text = "70-80%"
        }
        if complianceValue == 4 {
            complianceSliderLabel.text = "80-90%"
        }
        if complianceValue == 5 {
            complianceSliderLabel.text = "90-100%"
        }
    }
    
    var positiveReinforcementValue = 3
    @IBAction func positiveReinforcementSliderValueChanged(sender: AnyObject) {
        positiveReinforcementValue = Int(positiveReinforcementSlider.value)
        if positiveReinforcementValue == 1 {
            positiveReinforcementSliderLabel.text = "0"
        }
        if positiveReinforcementValue == 2 {
            positiveReinforcementSliderLabel.text = "1"
        }
        if positiveReinforcementValue == 3 {
            positiveReinforcementSliderLabel.text = "2"
        }
        if positiveReinforcementValue == 4 {
            positiveReinforcementSliderLabel.text = "3+"
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        // self refers to the viewController because its referenced there...
        // So viewController is a delegate for the following textFields:
        
       // checkboxLabel.delegate = self
        checkboxComments.delegate = self
        
        componentOfReadingLabel.text = "Component of Reading"
        
        self.check0.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check0.textLabel.text = "Phonomic Awareness"
        //self.check0.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check0.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)

        self.check1.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check1.textLabel.text = "Phonics"
        //self.check1.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check1.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.check2.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check2.textLabel.text = "Vocabulary"
        //self.check2.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check2.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.check3.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check3.textLabel.text = "Fluency"
        //self.check3.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check3.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)

        self.check4.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.check4.textLabel.text = "Comprehension"
        //self.check4.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.check4.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)

        

        self.timeInTextLabel.text = "Time in Text"
        self.timeInTextCheck.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.timeInTextCheck.textLabel.text = "Observed Time in Text"
        //self.timeInTextCheck.addTarget(self, action: "tapCheck:", forControlEvents: UIControlEvents.ValueChanged)
        self.timeInTextCheck.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.writingInResponsesToReadingLabel.text = "Writing in Responses to Reading"
        self.writingInResponsesToReadingCheck.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.writingInResponsesToReadingCheck.textLabel.text = "Observed Writing in Responses to Reading"
        //self.writingInResponsesToReadingCheck.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.writingInResponsesToReadingCheck.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        self.checksForUnderstandingLabel.text = "Checks for Understanding"
        self.checksForUnderstandingCheck.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.checksForUnderstandingCheck.textLabel.text = "Observed Checking for Understanding"
        //self.checksForUnderstandingCheck.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.checksForUnderstandingCheck.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        self.engagementLabel.text = "Engagement"
        
        self.complianceLabel.text = "Compliance"
        
        self.positiveReinforcementLabel.text = "Positive Reinforcement"
        
        self.guidedPracticeLabel.text = "Guided Practice"
        self.guidedPracticeCheck0.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.guidedPracticeCheck0.textLabel.text = "I Do"
        //self.guidedPracticeCheck0.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.guidedPracticeCheck0.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.guidedPracticeCheck1.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.guidedPracticeCheck1.textLabel.text = "We Do"
        //self.guidedPracticeCheck1.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.guidedPracticeCheck1.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        self.guidedPracticeCheck2.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.guidedPracticeCheck2.textLabel.text = "You Do"
        //self.guidedPracticeCheck2.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.guidedPracticeCheck2.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.responsesLabel.text = "Responses"
        self.responsesCheck0.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.responsesCheck0.textLabel.text = "Individual"
        //self.responsesCheck0.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.responsesCheck0.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.responsesCheck1.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.responsesCheck1.textLabel.text = "Partner"
        //self.responsesCheck1.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.responsesCheck1.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.responsesCheck2.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.responsesCheck2.textLabel.text = "Small Group"
        //self.responsesCheck2.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.responsesCheck2.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.responsesCheck3.color(UIColor.blackColor(), forState: UIControlState.Normal)
        self.responsesCheck3.textLabel.text = "Whole Group Choral Responses"
        //self.responsesCheck3.addTarget(self, action: "tapCheck", forControlEvents: UIControlEvents.ValueChanged)
        self.responsesCheck3.addTarget(self, action: #selector(Readingk6ViewController.tapCheck(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
        
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
       print("made it into prepareForSegue")
        
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
