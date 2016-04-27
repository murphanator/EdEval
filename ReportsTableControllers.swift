//
//  ReportsTableControllersTableViewController.swift
//  EdEval
//
//  Created by Capital High on 1/23/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class ReportsTableControllers: UITableViewController {
    
    //This array will store the names of each report
    var reportTableData = [Report]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaultReports()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadDefaultReports() {
        let report1 = Report(reportName: "Reading K-6")!
        let report2 = Report(reportName: "Math K-6")!
        //add default reports to the array
        reportTableData += [report1, report2]      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportTableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ReportsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ReportsTableViewCell
        
        //Get the appropiate report for the data source layout
        let report = reportTableData[indexPath.row]
        
       cell.reportLabel.text = report.reportName
        //cell.textLabel!.text = report.reportName    //NEW

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //Code to be run on tableViewCell touch
        
        
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "reportSegue" {
            //get the ReadingK6 view controller,downcast
            let nav = segue.destinationViewController as! UINavigationController
            let reportVC = nav.topViewController as! Readingk6ViewController
            
            //get the selected cell's indexPath
            let thePath = tableView.indexPathForCell(sender as! UITableViewCell)!
            //get the cell
            let theCell = tableView.cellForRowAtIndexPath(thePath)
            //get the name of the cell
            let cellName = theCell?.textLabel?.text
            //let cellName = theCell.reportLabel.text
            reportVC.title = cellName
            print("cell Name=",cellName, " the cell= ", theCell)
            
        }
        /*
         let nav = segue?.destinationViewController as! UINavigationController
         let svc = nav.topViewController as! SearchViewController
         svc.toPassSearchKeyword = searchKeyword;
        */
        
    }
    

}
