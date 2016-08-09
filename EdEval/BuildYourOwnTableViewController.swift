//
//  BuildYourOwnTableViewController.swift
//  EdEval
//
//  Created by Capital High on 7/10/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit
import DataEntryToolbar

class BuildYourOwnTableViewController: UITableViewController, UITextFieldDelegate {
    
    /// An enum for sections in the tableView.
    enum TableSections: Int {
        case BasicInfo = 0, LabelAndDate, MoreOptions, Items, AddNewItem
    }
    

    
    // -----------------------------------------
    // MARK: - IBOutlets
    // -----------------------------------------
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var sliderButton: UIBarButtonItem!
    @IBOutlet weak var choiceBoxButton: UIBarButtonItem!
    @IBOutlet weak var commentBoxButton: UIBarButtonItem!
    @IBOutlet weak var categoryButton: UIBarButtonItem!
    @IBOutlet weak var textButton: UIBarButtonItem!

    
    // -----------------------------------------
    // MARK: - Private class properties
    // -----------------------------------------
    
    private var items: [String?] = Array()
    private var optionAValue: String = ""
    private var optionBValue: String = ""
    private var textFieldData: [NSIndexPath: String] = [:]
    
/*    - (void) viewWillAppear:(BOOL)animated
    {
        [self.UITableViewController setToolbarHidden:NO animated:YES];
    }
    
    - (void)viewWillDisappear:(BOOL)animated
    {
        [self.BuildYourOwnTableViewController setToolbarHidden:YES animated:YES];
    }
*/
    
    /// A lazy loaded DataEntryToolbar object to be used as inputAccessoryView for text fields and pickers.
    private lazy var dataEntryToolbar: DataEntryToolbar? = {
        if let dataEntryToolbar = DataEntryToolbar(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 44), table:self.tableView) as DataEntryToolbar? {
            
            // implement closures
            dataEntryToolbar.didTapPreviousButtonFromTextField = { (lastActiveTextField) in
                if let textField = lastActiveTextField {
                    self.textFieldShouldReturn(textField)
                }
            }
            
            dataEntryToolbar.didTapNextButtonFromTextField = { (lastActiveTextField) in
                if let textField = lastActiveTextField {
                    self.textFieldShouldReturn(textField)
                }
            }
            
            dataEntryToolbar.didTapDoneButtonFromTextField = { (lastActiveTextField) in
                if let textField = lastActiveTextField {
                    self.textFieldShouldReturn(textField)
                }
            }
            
            return dataEntryToolbar
            
        } else {
            return nil
        }
    }()
    
    /// A lazy loaded UIDatePicker.
    private lazy var datePicker: UIDatePicker? = {
        if let datePicker = UIDatePicker() as UIDatePicker? {
            datePicker.addTarget(self, action: #selector(BuildYourOwnTableViewController.updateDate(_:)), forControlEvents: .ValueChanged)
            datePicker.datePickerMode = .Date
            return datePicker
        } else {
            return nil
        }
    }()
    
    // -----------------------------------------
    // MARK: - IBAction Methods
    // -----------------------------------------
    
    /// Called when a user taps the save button, adding the new thing being entered to wherever. Also clears textFields so another thing can be added.
    
    //***//orgiginal:     @IBAction func save() {
    @IBAction func save(sender: UIBarButtonItem) {
    
        // TODO: save data from text fields
        
        // clear out all the textFields
        self.clearTextFieldData()
    }
    
    /// Called when a user taps the trash icon, deleting the current info and clearing all textFields.
    @IBAction func trash() {
        //self.managedObjectContext?.rollback()
        
        // clear out all the textFields
        self.clearTextFieldData()
    }
    
    /// Fires when a user changes the optionA segmented control, saving the current state in `optionAValue`.
    @IBAction func optionAChanged(sender: UISegmentedControl) {
        self.optionAValue = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
    }
    
    /// Fires when a user changes the optionB segmented control, saving the current state in `optionBValue`.
    @IBAction func optionBChanged(sender: UISegmentedControl) {
        self.optionBValue = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
    }
    
    
    // -----------------------------------------
    // MARK: - View Lifecycle Methods
    // -----------------------------------------
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // tableView should be in editing mode so insert icons show for adding additional items in the dynamic section
        self.tableView.setEditing(true, animated: false)
                
        /*    - (void) viewWillAppear:(BOOL)animated
         {
         [self.UITableViewController setToolbarHidden:NO animated:YES];
         }
         
         - (void)viewWillDisappear:(BOOL)animated
         {
         [self.BuildYourOwnTableViewController setToolbarHidden:YES animated:YES];
         }
         */
        navigationController?.setToolbarHidden(false, animated: true)
        
        

    }

    // -----------------------------------------
    // MARK: - Private Class Methods
    // -----------------------------------------
    
    /** A method to add a new empty item to the array of items.
     
     :returns: An int containing the current number of items.
     */
    private func addNewItem() -> Int {
        
        // add ingredient to items array
        self.items.append("")
        self.tableView.reloadData()
        
        return self.items.count
    }
    
    /// A method to delete an item that was added by the user, also deletes that row from the table.
    private func deleteItem(indexPath: NSIndexPath) {
        
        // remove item from arrays
        self.items.removeAtIndex(indexPath.row)
        self.textFieldData[indexPath] = nil
    }
    
    /// A method to empty out the textFields when a new item is saved or cancelled.
    func clearTextFieldData() {
        
        // disable save button
        self.saveButton.enabled = false
        
        // delete textField data
        self.textFieldData.removeAll(keepCapacity: true)
        
        // empty items array
        self.items.removeAll(keepCapacity: false)
        
        // reload the table & scroll to top
        self.tableView.reloadData()
        self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: .Top, animated: true)
    }
    
    // -----------------------------------------
    // MARK: - UIDatePicker Selectors
    // -----------------------------------------
    
    /// A method to update the textField in the tableView when the datePicker value changes.
    func updateDate(sender: UIDatePicker) {
        let indexPath = NSIndexPath(forRow: 1, inSection: TableSections.LabelAndDate.rawValue)
        if let cell = self.tableView.cellForRowAtIndexPath(indexPath) as? BYOCustomLabelCell {
            if let textField = cell.textField {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .ShortStyle
                textField.text = dateFormatter.stringFromDate(sender.date)
            }
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case TableSections.BasicInfo.rawValue:    return 3
        case TableSections.LabelAndDate.rawValue: return 2
        case TableSections.MoreOptions.rawValue:  return 3
        case TableSections.Items.rawValue:        return self.items.count
        case TableSections.AddNewItem.rawValue:   return 1
        default: return 0
        }
    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch (indexPath.section) {
            
        // first section -- basic info
        case TableSections.BasicInfo.rawValue:
            switch (indexPath.row) {
            case 0:
                let nameCell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
                nameCell.textField.inputAccessoryView = self.dataEntryToolbar
                self.dataEntryToolbar?.tableTextFields[indexPath] = nameCell.textField
                nameCell.textField.text = self.textFieldData[indexPath]
                return nameCell
            case 1:
                let categoryCell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as! BYOCustomLabelCell
                categoryCell.textField.inputAccessoryView = self.dataEntryToolbar
                self.dataEntryToolbar?.tableTextFields[indexPath] = categoryCell.textField
                categoryCell.textField.text = self.textFieldData[indexPath]
                return categoryCell
            default:
                let optionsCell = tableView.dequeueReusableCellWithIdentifier("OptionsCell", forIndexPath: indexPath) as! BYOCustomSegConCell
                let segmentedControl = optionsCell.segmentedControl
                self.optionAValue = segmentedControl.titleForSegmentAtIndex(segmentedControl.selectedSegmentIndex)!
                return optionsCell
            }
            
        // second secion -- labels, dates
        case TableSections.LabelAndDate.rawValue:
            switch (indexPath.row) {
            case 0:
               // let labelCell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath) as! BYOCustomLabelCell
                
                let labelCell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
                
                labelCell.textField.inputAccessoryView = self.dataEntryToolbar
                self.dataEntryToolbar?.tableTextFields[indexPath] = labelCell.textField
                labelCell.textField.text = self.textFieldData[indexPath]
                return labelCell
            default:
                //let dateCell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as! BYOCustomLabelCell
                
                let dateCell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
                dateCell.textField.inputView = self.datePicker
                dateCell.textField.inputAccessoryView = self.dataEntryToolbar
                self.dataEntryToolbar?.tableTextFields[indexPath] = dateCell.textField
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateStyle = .ShortStyle
                dateCell.textField.text = self.textFieldData[indexPath]
                return dateCell
            }
        
        // third section -- more options
        case TableSections.MoreOptions.rawValue:
            switch (indexPath.row) {
            case 0:
                //let labelCell2 = tableView.dequeueReusableCellWithIdentifier("LabelCell2", forIndexPath: indexPath) as! BYOCustomLabelCell

                let labelCell2 = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
                labelCell2.textField.inputAccessoryView = self.dataEntryToolbar
                self.dataEntryToolbar?.tableTextFields[indexPath] = labelCell2.textField
                labelCell2.textField.text = self.textFieldData[indexPath]
                return labelCell2
            case 1:
                //let anotherCell = tableView.dequeueReusableCellWithIdentifier("AnotherCell", forIndexPath: indexPath) as! BYOCustomLabelCell
                
                let anotherCell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
                anotherCell.textField.inputAccessoryView = self.dataEntryToolbar
                self.dataEntryToolbar?.tableTextFields[indexPath] = anotherCell.textField
                anotherCell.textField.text = self.textFieldData[indexPath]
                return anotherCell
            default:
                //let moreOptionsCell = tableView.dequeueReusableCellWithIdentifier("MoreOptionsCell", forIndexPath: indexPath) as! BYOCustomSegConCell
                
                let moreOptionsCell = tableView.dequeueReusableCellWithIdentifier("OptionsCell", forIndexPath: indexPath) as! BYOCustomSegConCell
                let segmentedControl = moreOptionsCell.segmentedControl
                self.optionBValue = segmentedControl.titleForSegmentAtIndex(segmentedControl.selectedSegmentIndex)!
                return moreOptionsCell
            }
            
        
        // fourth section -- newly added items
        case TableSections.Items.rawValue:
            //let itemCell = tableView.dequeueReusableCellWithIdentifier("InsertedItemCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
            
            let itemCell = tableView.dequeueReusableCellWithIdentifier("NameCell", forIndexPath: indexPath) as! BYOCustomTextFieldCell
            itemCell.textField.inputAccessoryView = self.dataEntryToolbar
            self.dataEntryToolbar?.tableTextFields[indexPath] = itemCell.textField
            itemCell.textField.delegate = self
            itemCell.textField.text = self.textFieldData[indexPath]
            return itemCell
            
        // fifth section -- trigger to add new items
        default:
            let addItemCell = tableView.dequeueReusableCellWithIdentifier("AddNewItemCell", forIndexPath: indexPath) as UITableViewCell
            return addItemCell
        }
 
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // can edit sections from items on down
        return indexPath.section >= TableSections.Items.rawValue
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        switch (indexPath.section) {
        case TableSections.Items.rawValue:
            return .Delete
        case TableSections.AddNewItem.rawValue:
            return .Insert
        default:
            return .None
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            // remove from data source
            if indexPath.section == TableSections.Items.rawValue {
                self.deleteItem(indexPath)
            }
            
            // remove row from table
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            
            // Insert new item into the array and add a new row to the table view
            if (indexPath.section == TableSections.AddNewItem.rawValue) {
                self.addNewItem()
            }
        }
    }
    
    // -----------------------------------------
    // MARK: - UITableView Delegate Methods
    // -----------------------------------------
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == TableSections.Items.rawValue && self.items.count == 0) {
            return 1
        } else {
            return 33
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    // -----------------------------------------
    // MARK: - UITextFieldDelegate methods
    // -----------------------------------------
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // check if this textField contains a new item to add and add to corresponding array
        if let pointInTable: CGPoint = textField.superview?.convertPoint(textField.frame.origin, toView: self.tableView) {
            if let indexPath: NSIndexPath = self.tableView.indexPathForRowAtPoint(pointInTable) {
                self.textFieldData[indexPath] = textField.text
            }
        }
        
        // check if all textFields have been filled out, enable save button if ready
        if let textFields = self.dataEntryToolbar?.tableTextFields {
            
            var incompleteData: Bool = false
            for (indexPath, currentTextField) in textFields {
                
                // check for incomplete data
                if currentTextField.text == "" {
                    incompleteData = true
                }
            }
            
            if incompleteData {
                self.saveButton.enabled = false
            } else {
                self.saveButton.enabled = true
            }
        }
        
        return true
    }



    
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
