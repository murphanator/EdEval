//
//  ExampleCheckBox.swift
//  EdEval
//
//  Created by Capital High on 12/22/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit

class ExampleCheckBox: UIImage {

    
    //Images
    let exampleCheckedImage = UIImage(named: "CheckedBox")
    let exampleUnCheckedImage = UIImage(named: "EmptyBox")
    
    //Bool Property
    var exampleIsChecked:Bool = false {
        didSet{
            print("***** isChecked *****   ", exampleIsChecked)
            if exampleIsChecked == true{
                //setImage(exampleCheckedImage, forState: .Normal)
                print("#######exampleIsChecked is true")
            }
            else{
                //setImage(exampleUnCheckedImage, forState: .Normal)
                print("#########exampleIsChecke is false###")
            }
        }
    }
    
    override func awakeFromNib() {
        //self.select(self,action:"exampleButtonClicked")
        self.exampleIsChecked = false
    }
    
    
    func exampleButtonClicked(sender:UIButton){
        print("%%%%%% buttonClicked %%%%%  ",sender,"#######",self)
        if(sender == self){
            if exampleIsChecked == true{
                exampleIsChecked = false
            }
        }
        else{
            exampleIsChecked = true
        }
    }
    
}
