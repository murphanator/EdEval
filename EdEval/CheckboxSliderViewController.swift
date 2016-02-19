//
//  CheckboxSliderViewController.swift
//  EdEval
//
//  Created by Capital High on 1/4/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class CheckboxSliderViewController: UIViewController {

    var currentValue = 5
    @IBOutlet weak var labelForSlider: UILabel!
    @IBOutlet weak var SliderForCheckbox: UISlider!
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        currentValue = Int(SliderForCheckbox.value);
        labelForSlider.text = "\(currentValue)"
       // labelForSlider.text = currentValue as? String
        //print(currentValue)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "sliderSegue") {
           
            
            //Get a reference to the second view controller: CheckBoxControllerViewController
            //MLK DAY let destinationVC = segue.destinationViewController as! CheckBoxControllerViewController
            //MLK DAYdestinationVC.stars = Int(SliderForCheckbox.value)
           
            //NEW! Lets see if this works...
            //NEW let destinationVC = segue.destinationViewController as! GlobalVariables1
            
            
          
 // ********         globalVariablesInstance.numberOfCheckboxes = currentValue
            GlobalVariables1.init(numberOfCheckboxes: 5, textboxTitleArray: ["a1","b1","c1","d1","e1"])
            globalVariablesInstance.numberOfCheckboxes = 5
            globalVariablesInstance.textboxTitleArray = ["a1","b1","c1","d1","e1"]
            
            //   let destinationView = CheckboxControl.self
            //   destinationView.numberOfCheckboxes = Int(SliderForCheckbox.value)

            
            
        }
    }
    
    //let destinationVC:ViewControllerClass = segue.destinationViewController as ViewControllerClass
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if (segue.identifier == "YourSegueName") {
            //get a reference to the destination view controller
            let destinationVC:ViewControllerClass = segue.destinationViewController
            
            //set properties on the destination view controller
            destinationVC.name = viewName
            //etc...
        }
    }
*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
