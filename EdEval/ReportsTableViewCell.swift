//
//  ReportsTableViewCell.swift
//  EdEval
//
//  Created by Capital High on 1/23/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class ReportsTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var reportLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
