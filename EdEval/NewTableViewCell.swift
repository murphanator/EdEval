//
//  NewTableViewCell.swift
//  EdEval
//
//  Created by Capital High on 8/10/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var AddSlider: UIButton!
    @IBOutlet weak var AddChoiceBox: UIButton!
    @IBOutlet weak var AddCommentBox: UIButton!
    @IBOutlet weak var AddCategory: UIButton!
    @IBOutlet weak var AddText: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
