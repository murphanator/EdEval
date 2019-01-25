 //
//  CheckboxView.swift
//  EdEval
//
//  Created by Capital High on 2/21/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

@IBDesignable class CheckboxView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

        // MARK: Properties

        // @@@@@ Our custom view from the XIB file
        //@IBOutlet weak var label: UILabel!
        //@IBOutlet weak var imageView: UIImageView!
        //@IBOutlet weak var button: UIButton!
        //@IBAction func buttonPressed(sender: AnyObject) {
        // do something
        //}
        
        
        var view: UIView!
    
        var checkButtons = [UIButton]()
        var checkTxtField = [UITextField]()
        var arrayOfCheckboxTitles:[String] = [""]
    
        var spacing = 5
        var checkboxTotal:Int = 1 //default number of checkboxes is 1

// The init(coder:) is called when creating your view within another interface file.
//The init(frame:) is called when creating your view programmatically
    
        override init(frame: CGRect) {
            // 1. setup any properties here
            // 2. call super.init(frame:)
            super.init(frame: frame)
            // 3. Setup view from .xib file
            xibSetup()
        }
        //@@@required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        // 2. call super.init(coder:)
        //@@@super.init(coder: aDecoder)
        // 3. Setup view from .xib file
        //@@@@xibSetup()
        //@@@}
        
        func xibSetup() {
            view = loadViewFromNib()
            
            // use bounds not frame or it'll be offset
            view.frame = bounds
            
            // Make the view stretch with containing view
            view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
            // Adding custom subview on top of our view (over any custom drawing > see note below)
 
           //#$% addSubview(view)
        } //xibSetup
    
        func loadViewFromNib() -> UIView {
 
            print("init: ", arrayOfCheckboxTitles)
            
            let checkedImage = UIImage(named: "CheckedBox")
            let unCheckedImage = UIImage(named: "EmptyBox")
            
            for i in 0..<checkboxTotal {
                let button = UIButton()
                let txtField = UITextField()
                
                button.setImage(unCheckedImage, for: UIControlState())
                button.setImage(checkedImage, for: .selected)
                button.setImage(checkedImage, for: [.highlighted, .selected])
                
                button.adjustsImageWhenHighlighted = false
                
                button.addTarget(self, action: #selector(CheckboxView.checkboxTapped(_:)), for: .touchDown)
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
            
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: "CheckboxView", bundle: bundle)
            
            // Assumes UIView is top level and only object in CustomView.xib file
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            return view
        }
    
        var buttonNumberTapped = 0 {
            didSet {
                setNeedsLayout()
            }
        }
               //MARK: Initialization
        
        func PassValues(_ checkboxTotal:Int, arrayOfCheckboxTitles:[String]){
            self.checkboxTotal = checkboxTotal
            self.arrayOfCheckboxTitles = arrayOfCheckboxTitles
            print("checkbox totals=  ",checkboxTotal)
            print("array of check boxes=  ", arrayOfCheckboxTitles)
            //  CheckboxControl2.init()
            
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)

            xibSetup()
            
            
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

