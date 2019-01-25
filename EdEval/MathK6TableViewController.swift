//
//  MathK6TableViewController.swift
//  EdEval
//
//  Created by Capital High on 4/26/16.
//  Copyright © 2016 Capital High. All rights reserved.
//



import UIKit
import Eureka
import CoreLocation

//class MathK6TableViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

class MathK6TableViewController: FormViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("MathK6 ... Made it in")
        URLRow.defaultCellUpdate = {cell,row in cell.textField.textColor = .blue}
        LabelRow.defaultCellUpdate = {cell, row in cell.detailTextLabel?.textColor = .orange}
        CheckRow.defaultCellUpdate = {cell, row in cell.tintColor = .orange}
        DateRow.defaultRowInitializer = {row in row.minimumDate = Date()}
        
        form =
            Section()
            <<< LabelRow(){
                    $0.title = " Math LabelRow Example"
                    $0.value = " Tap the Row"
                }
            .onCellSelection{cell, row in
                row.title = "Math Title thingy"
                row.reload()
            }
            <<< DateRow() {
                $0.value = Date()
                $0.title = "DateRow"
            }
        
            <<< CheckRow(){
                $0.title = "CheckRow"
                $0.value = true
            }
            <<< SwitchRow(){
                $0.title = "SwitchRow"
                $0.value = true
            }
        
        +++ Section("Section test")
            <<< SliderRow(){
                $0.title = "SliderRow"
                $0.value = 5.0
            }
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning...MADE IT IN")
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        print("number of Sections in tableview ...MADE IT IN")
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("tableview ...MADE IT IN")
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
