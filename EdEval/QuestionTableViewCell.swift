//
//  QuestionTableViewCell.swift
//  EdEval
//
//  Created by Capital High on 11/27/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell, UITableViewDelegate {
   //class QuestionTableViewCell: UITableViewCell CheckBoxQuestionTableViewController{
    
// TO DO: This cell should have a title displayed and a checkbox + Label for the amount
//        of checkboxes the user needs. Should not have 5 hard-coded outlets.
    
    //MARK: Initialization
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        ///***see "implement a custom control" to set up checkbox
//    }

    // MARK: Properties


    @IBOutlet weak var checkboxButton: CheckboxControl!
    @IBOutlet weak var checkboxButton2: CheckboxControl!
    @IBOutlet weak var checkboxButton3: CheckboxControl!
    @IBOutlet weak var checkboxButton4: CheckboxControl!
    @IBOutlet weak var checkboxButton5: CheckboxControl!
    
   
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var choiceLabelForCheckbox: UILabel!
    @IBOutlet weak var choiceLabelForCheckbox2: UILabel!
    @IBOutlet weak var choiceLabelForCheckbox3: UILabel!
    @IBOutlet weak var choiceLabelForCheckbox4: UILabel!
    @IBOutlet weak var choiceLabelForCheckbox5: UILabel!
    
    override func awakeFromNib() {
        //super.awakeFromNib()
        // Initialization code
        questionLabel.text = "Component of Reading:"
        choiceLabelForCheckbox.text = "Phonemic awareness"
        choiceLabelForCheckbox2.text = "Phonics"
        choiceLabelForCheckbox3.text = "Vocabulary"
        choiceLabelForCheckbox4.text = "Fluency"
        choiceLabelForCheckbox5.text = "Comprehension"
              
    }
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
