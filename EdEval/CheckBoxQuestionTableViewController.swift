//
//  CheckBoxQuestionTableViewController.swift
//  EdEval
//
//  Created by Capital High on 11/29/15.
//  Copyright © 2015 Capital High. All rights reserved.
//

import UIKit

class CheckBoxQuestionTableViewController: UITableViewController{
//class CheckBoxQuestionTableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    

  
   // @IBOutlet weak var checkMark: UIImageView!
    
     //@IBOutlet weak var checkboxButton2: UIButton!
    // MARK: Properties
    // MARK: Properties
    //@IBOutlet weak var questionLabel: UILabel!
    //@IBOutlet weak var checkBoxButton: CheckBox!
    //@IBOutlet weak var choiceLabelForCheckbox: UIView!
    
    //Trying to get an outlet to the tableView Cell I created
    //Outlets for the question,checkbox and choice are in
    //QuestionTableViewCell
   // @IBOutlet weak var tblView: UINavigationItem!
    
    @IBOutlet weak var tblView: QuestionTableViewCell!
   let CellIdentifier = "QuestionTableViewCell"
    
    var questions = [QuestionTableViewCell]()

   override func viewDidLoad() {
        super.viewDidLoad()
    
        //checkboxButton2.isChecked = true
        //self.checkboxButton2.awakeFromNib()
        //checkboxButton2.checkedImage = "checkedBox"
   

        //added this may screw it up...
      //****///  tableView.dataSource = self
       //****/// tableView.registerClass(QuestionTableViewCell.self, forCellReuseIdentifier: CellIdentifier)

        //questionLabel.delegate = self
        //checkboxButton2.delegate = self
        //choiceLabelForCheckbox = self

    
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      //****////  self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
 /*   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCellWithIdentifier("QuestionTableViewCell", forIndexPath: indexPath)
*/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("QuestionTableViewCell") as?
            QuestionTableViewCell
                else{
                return UITableViewCell()
        }
        
        
        
        //let cell:QuestionTableViewCell = self.tblView.("Cell",forIndexPath: indexPath) as! QuestionTableViewCell
        
        // Configure the cell...
        //test this... don't think it works
        //cell.textLabel?.text = "My First Question"
        //questionLabel.text = "test"
        return cell
    }
    
    /****
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier("IdentifierInInterfaceBuilder") as? MyCustomTableViewCell else {
    return UITableViewCell()
    }
    
    return cell
    }

****/
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
