//
//  BYOCustomTextFieldCell.swift
//  EdEval
//
//  Created by Capital High on 7/12/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class BYOCustomTextFieldCell: UITableViewCell {
    //@IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        textField.text = ""
        self.textField.inputView = nil
        self.textField.inputAccessoryView = nil
    }
    
    /**
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    **/

}
