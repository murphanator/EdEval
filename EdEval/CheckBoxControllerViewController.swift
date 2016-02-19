//
//  CheckBoxControllerViewController.swift
//  EdEval
//
//  Created by Capital High on 1/10/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class CheckBoxControllerViewController: UIViewController{

   // var myStars:Int = 0
    
    @IBOutlet weak var CheckBoxOutlet: CheckboxControl!
    

// var stars:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //labelB.text = secondDataPassed
       //MARK: To-Do:
        //Works...Value is being passed from SliderViewControl to CheckboxView Controller
        //Now...Send this value(stars) to the UIView (CheckboxControl)
        
        //CheckBoxOutlet.numberOfCheckboxes = stars
    //    print("stars in checkboxcontrollerview controller= ", stars)
        
       //let destinationVC = segue.destinationViewController as! CheckBoxControllerViewController
        //destinationVC.stars = Int(SliderForCheckbox.value)
        
       // let destinationView = CheckBoxOutlet
        //destinationView.numberOfCheckboxes = stars
        
       //CheckBoxOutlet.numberOfCheckboxes = stars
        


        // Do any additional setup after loading the view.
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        
            }
    */

}
