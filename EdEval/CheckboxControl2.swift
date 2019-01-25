//
//  CheckboxControl2.swift
//  EdEval
//
//  Created by Capital High on 2/9/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit
class CheckboxControl2: UIControl{

    // MARK: Properties
    /*
    A property observer observes and responds to changes in a property’s value. Property observers are called every time a property’s value is set, and can be used to perform work immediately before or after the value changes. Specifically, the didSet property observer is called immediately after the property’s value is set. Here, you include a call to setNeedsLayout(), which will trigger a layout update every time the buttonNumberTapped changes. This ensures that the UI is always showing an accurate representation of the buttonNumberTapped property value.
    */
    
    var buttonNumberTapped = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
 /*   var checkboxColor:UIColor = UIColor.blackColor() {
        didSet {
            self.textLabel.textColor = self.checkboxColor
            self.setNeedsDisplay()
        }
    }
*/
    
    var checkButtons = [UIButton]()
    var checkTxtField = [UITextField]()
   var arrayOfCheckboxTitles:[String] = ["","b","","d","e"]
    
    var spacing = 5
    var checkboxTotal:Int = 5 //default number of checkboxes is 5

    
    
    //MARK: Initialization
      
   func PassValues(_ checkboxTotal:Int, arrayOfCheckboxTitles:[String]){
        self.checkboxTotal = checkboxTotal
        self.arrayOfCheckboxTitles = arrayOfCheckboxTitles
        print("checkbox totals=  ",checkboxTotal)
        print("array of check boxes=  ", arrayOfCheckboxTitles)
      //  CheckboxControl2.init()
        
        
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
 func commonInit() {
    
        let checkedImage = UIImage(named: "CheckedBox")
        let unCheckedImage = UIImage(named: "EmptyBox")
        
        ////********Left Off 2.8.2016 getting data from reading k6 Instance....
        //checkboxTotal = globalVariablesInstance.numberOfCheckboxes
        //arrayOfCheckboxTitles = readingK6Instance.textboxTitlesForCheckboxes
        
        //999 checkboxTotal = globalVariablesInstance.numberOfCheckboxes
        //999 arrayOfCheckboxTitles = globalVariablesInstance.textboxTitleArray
        
        for i in 0..<checkboxTotal {
            let button = UIButton()
            let txtField = UITextField()
            
            button.setImage(unCheckedImage, for: UIControlState())
            button.setImage(checkedImage, for: .selected)
            button.setImage(checkedImage, for: [.highlighted, .selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: #selector(CheckboxControl2.checkboxTapped(_:)), for: .touchDown)
            checkButtons += [button]
            
            addSubview(button)
            
            //textfield sub view
            if (arrayOfCheckboxTitles[i] == ""){
                txtField.backgroundColor = UIColor.yellow
            }
            else{
                txtField.backgroundColor = UIColor.clear
            }
            txtField.textColor = UIColor.black
            txtField.adjustsFontSizeToFitWidth = true
            if (arrayOfCheckboxTitles[i] == ""){
                txtField.text = "click to edit text"
            }
            else{
                txtField.text = arrayOfCheckboxTitles[i]
            }
            if (arrayOfCheckboxTitles[i] == ""){
                txtField.borderStyle = UITextBorderStyle.bezel
            }
            else{
                txtField.borderStyle = UITextBorderStyle.none
            }
            
            checkTxtField += [txtField]
            
            addSubview(txtField)
        }
    }

    //***********************
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // Set the button's width and height to a square the size of the frame's height
        let buttonSize = Int((frame.size.width/12))
        //Set the text field width
        let txtFieldSize = Int((frame.size.width - (frame.size.width/12)) - 5)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        var txtFieldFrame = CGRect(x: buttonSize + spacing, y: buttonSize, width: txtFieldSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus some spacing.
        for (index, button) in checkButtons.enumerated() {
            buttonFrame.origin.y = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
            
        }
        for (index, txtField) in checkTxtField.enumerated() {
            txtFieldFrame.origin.y = CGFloat(index * (buttonSize + spacing))
            txtField.frame = txtFieldFrame
            
        }
        updateButtonSelectionStates()
    }
    
    //MARK: Button Action
    func checkboxTapped(_ button: UIButton) {
        buttonNumberTapped = checkButtons.index(of: button)! + 1
        
        if checkButtons[buttonNumberTapped-1].isSelected == true {
            checkButtons[buttonNumberTapped-1].isSelected = false
        }
        else{
            checkButtons[buttonNumberTapped-1].isSelected = true
        }
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in checkButtons.enumerated() {
            button.isSelected = checkButtons[index].isSelected
        }
        //need to update the text field and put in array
        /*for (index,txtField) in checkTxtField.enumerate() {
        txtField.selected =
        }*/
    }
    
}


//*******************************************************************************
/*
import UIKit
class CheckboxControl2: UIView{

// MARK: Properties
/*
A property observer observes and responds to changes in a property’s value. Property observers are called every time a property’s value is set, and can be used to perform work immediately before or after the value changes. Specifically, the didSet property observer is called immediately after the property’s value is set. Here, you include a call to setNeedsLayout(), which will trigger a layout update every time the buttonNumberTapped changes. This ensures that the UI is always showing an accurate representation of the buttonNumberTapped property value.
*/
var buttonNumberTapped = 0 {
didSet {
setNeedsLayout()
}
}
var checkButtons = [UIButton]()
var checkTxtField = [UITextField]()
var arrayOfCheckboxTitles:[String] = ["","b","","d","e"]

var spacing = 5
var checkboxTotal:Int = 5 //default number of checkboxes is 5

//MARK: Initialization

func PassValues(checkboxTotal:Int, arrayOfCheckboxTitles:[String]){
self.checkboxTotal = checkboxTotal
self.arrayOfCheckboxTitles = arrayOfCheckboxTitles
print("checkbox totals=  ",checkboxTotal)
print("array of check boxes=  ", arrayOfCheckboxTitles)
//  CheckboxControl2.init()


}

required init?(coder aDecoder: NSCoder) {
super.init(coder: aDecoder)


//wrestle  init(checkboxTotal:Int, arrayOfCheckboxTitles:[String]){
//CODE: put in a inititalizer that calls the above initializer
//override convenience init(name: String) {
//self.init(checkboxTotal: checkboxTotal, arrayOfCheckboxTitles: arrayOfCheckboxTitles)
//self.init()
// self.init(NSCoder)
//wrestle self.checkboxTotal = checkboxTotal
//wrestle self.arrayOfCheckboxTitles = arrayOfCheckboxTitles
//arrayOfCheckboxTitles = self.arrayOfCheckboxTitles

print("init: ", arrayOfCheckboxTitles)

//  } //init
//  super.init(coder: NSCoder())!

let checkedImage = UIImage(named: "CheckedBox")
let unCheckedImage = UIImage(named: "EmptyBox")

////********Left Off 2.8.2016 getting data from reading k6 Instance....
//checkboxTotal = globalVariablesInstance.numberOfCheckboxes
//arrayOfCheckboxTitles = readingK6Instance.textboxTitlesForCheckboxes

//999 checkboxTotal = globalVariablesInstance.numberOfCheckboxes
//999 arrayOfCheckboxTitles = globalVariablesInstance.textboxTitleArray

for i in 0..<checkboxTotal {
let button = UIButton()
let txtField = UITextField()

button.setImage(unCheckedImage, forState: .Normal)
button.setImage(checkedImage, forState: .Selected)
button.setImage(checkedImage, forState: [.Highlighted, .Selected])

button.adjustsImageWhenHighlighted = false

button.addTarget(self, action: "checkboxTapped:", forControlEvents: .TouchDown)
checkButtons += [button]

addSubview(button)

//textfield sub view
if (arrayOfCheckboxTitles[i] == ""){
txtField.backgroundColor = UIColor.yellowColor()
}
else{
txtField.backgroundColor = UIColor.clearColor()
}
txtField.textColor = UIColor.blackColor()
txtField.adjustsFontSizeToFitWidth = true
if (arrayOfCheckboxTitles[i] == ""){
txtField.text = "click to edit text"
}
else{
txtField.text = arrayOfCheckboxTitles[i]
}
if (arrayOfCheckboxTitles[i] == ""){
txtField.borderStyle = UITextBorderStyle.Bezel
}
else{
txtField.borderStyle = UITextBorderStyle.None
}

checkTxtField += [txtField]

addSubview(txtField)
}
//super.init(coder: aDecoder)

// //super.init(coder: NSCoder())!

}


//***********************


override func layoutSubviews() {
// Set the button's width and height to a square the size of the frame's height
let buttonSize = Int((frame.size.width/12))
//Set the text field width
let txtFieldSize = Int((frame.size.width - (frame.size.width/12)) - 5)

var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
var txtFieldFrame = CGRect(x: buttonSize + spacing, y: buttonSize, width: txtFieldSize, height: buttonSize)

// Offset each button's origin by the length of the button plus some spacing.
for (index, button) in checkButtons.enumerate() {
buttonFrame.origin.y = CGFloat(index * (buttonSize + spacing))
button.frame = buttonFrame

}
for (index, txtField) in checkTxtField.enumerate() {
txtFieldFrame.origin.y = CGFloat(index * (buttonSize + spacing))
txtField.frame = txtFieldFrame

}
updateButtonSelectionStates()
}

//MARK: Button Action
func checkboxTapped(button: UIButton) {
buttonNumberTapped = checkButtons.indexOf(button)! + 1

if checkButtons[buttonNumberTapped-1].selected == true {
checkButtons[buttonNumberTapped-1].selected = false
}
else{
checkButtons[buttonNumberTapped-1].selected = true
}

updateButtonSelectionStates()
}

func updateButtonSelectionStates() {
for (index, button) in checkButtons.enumerate() {
button.selected = checkButtons[index].selected
}
//need to update the text field and put in array
/*for (index,txtField) in checkTxtField.enumerate() {
txtField.selected =
}*/
}

}


*/*/*/
