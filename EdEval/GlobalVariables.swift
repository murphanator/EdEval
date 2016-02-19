//
//  GlobalVariables.swift
//  EdEval
//
//  Created by Capital High on 1/18/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

var checky:Int = 5
var textboxy:[String] = ["alpha1","beta1","delta1","Zeta1","Eta1"]

class GlobalVariables1{
    //MARK: Properties
    var numberOfCheckboxes:Int = 5
    var textboxTitleArray:[String] = ["alpha2","beta2","delta2","Zeta2","Eta2"]
    

    
    //MARK: Initialization
    init(numberOfCheckboxes:Int, textboxTitleArray:[String]){
        //self.numberOfCheckboxes = numberOfCheckboxes
        //self.textboxTitleArray = textboxTitleArray
       // numberOfCheckboxes = 5
        //textboxTitleArray = ["alpha1","beta2","delta2","Zeta2","Eta2"]
        //super.init(numberOfCheckboxes:numberOfCheckboxes, textboxTitleArray:textboxTitleArray)
        checky = numberOfCheckboxes
        textboxy = textboxTitleArray
       // CheckboxControl.init(checkboxTotal: numberOfCheckboxes, arrayOfCheckboxTitles: textboxTitleArray)

    }


}
var globalVariablesInstance = GlobalVariables1(numberOfCheckboxes: checky, textboxTitleArray: textboxy)

//var globalVariablesInstance = GlobalVariables1(numberOfCheckboxes:5, textboxTitleArray:["1","2","3","4","5"])


/*
class GlobalVariables1{
//MARK: Properties
var numberOfCheckboxes:Int  //set default number to 5

//MARK: Initialization
init(numberOfCheckboxes:Int){
self.numberOfCheckboxes = numberOfCheckboxes

}

}
var globalVariablesInstance = GlobalVariables1(numberOfCheckboxes:5)


*/