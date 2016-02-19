//
//  ExampleTableViewCell.swift
//  EdEval
//
//  Created by Capital High on 12/20/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit

class ExampleTableViewCell: UITableViewCell, UITableViewDelegate{
//class ExampleTableViewCell:UIImageView{
   
    
    //let exampleCheckedImage = UIImage(named: "CheckedBox")
    //let exampleUnCheckedImage = UIImage(named: "EmptyBox")

    
    @IBOutlet weak var checkMark: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       //***checkMark?.highlighted = selected
        checkMark?.highlighted = selected
        //checkMark.setImage(exampleCheckedImage, forState: .Normal)

        // Configure the view for the selected state
    }

}


/*

class ExampleTableViewCell: UITableViewCell {
@IBOutlet var checkMark: UIImageView?

override func setSelected(selected: Bool, animated: Bool) {
super.setSelected(selected, animated: animated)

checkMark?.highlighted = selected
}
}


*/