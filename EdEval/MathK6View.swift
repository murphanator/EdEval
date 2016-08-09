//
//  MathK6View.swift
//  EdEval
//
//  Created by Capital High on 5/3/16.
//  Copyright © 2016 Capital High. All rights reserved.
//  Added Eureka Form Builder

import UIKit
import Eureka
import CoreLocation
import Foundation
import MapKit



class MathK6View: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++
        Section("Components of Math")
            let mathComponents = ["Addition", "Subtraction", "Multiplication", "Divide"]
        form +++=
            SelectableSection<ImageCheckRow<String>, String>("Check all that apply:", selectionType: .MultipleSelection)
        for option in mathComponents {
            form.last! <<< ImageCheckRow<String>(option){ lrow in
                lrow.title = option
                lrow.selectableValue = option
                lrow.value = nil
                }.cellSetup { cell, _ in
                    //cell.trueImage = UIImage(named: "selectedRectangle")!
                    //cell.falseImage = UIImage(named: "unselectedRectangle")!
                    cell.trueImage = UIImage(named: "CheckedBox")!
                    cell.falseImage = UIImage(named: "EmptyBox")!
                }
        }
        form +++
        Section("Time in Text")
            <<< SwitchRow(){
                $0.title = "Did Observed Time in Text"
                $0.value = true
            }
            <<< SegmentedRow<String>(){
                $0.title = ""
                $0.options = ["< 1 minute", "1 to 2 minutes", "> 2 minutes"]
                $0.value = "> 2 minutes"
            }
        form +++
        Section("Writing in Response to Math")
            <<< SwitchRow(){
                $0.title = "Did observe writing in response to Math:"
                $0.value = true
            }
            <<< SegmentedRow<String>(){
                $0.title = ""
                $0.options = ["1-Words", "2-Sentence", "3-Multiple Sentences", "4-Paragraph", "5-Multiple Paragraphs"]
                $0.value = "3-Multiple Sentences"
            }
        form +++
        Section("Checks for Understanding")
            <<< SwitchRow(){
                $0.title = "Did observe Checking for understanding"
                $0.value = true
            }
            <<< SegmentedRow<String>(){
                $0.title = " "
                $0.options = ["1-Whole Class", "2-Partners", "3-Groups", "4-Individual"]
                $0.value = "3-Groups"
            }
        form +++
        Section("Engagement")
            <<< SwitchRow(){
                $0.title = "Did observe engagement"
                $0.value = true
            }
            <<< SegmentedRow<String>(){
                $0.title = " "
                $0.options = ["< 50%", "50-70%", "70-80%", "80-90%", "90-100%"]
                $0.value = "80-90%"
            }
        form +++
            Section("Compliance")
            <<< SwitchRow(){
                $0.title = "Did observe compliance"
                $0.value = true
            }
            <<< SegmentedRow<String>(){
                $0.title = " "
                $0.options = ["< 50%", "50-70%", "70-80%", "80-90%", "90-100%"]
                $0.value = "80-90%"
            }
        form +++
            Section("Positive Reinforcement")
            <<< SliderRow(){
                $0.title = "Positive Reinforcement:"
                $0.minimumValue = 0
                $0.maximumValue = 3
                $0.value = 2
                }
        form +++
            Section("Guided Practice")
        let guidedPracticeComponents = ["I Do", "We Do", "You Do"]
        form +++
            SelectableSection<ImageCheckRow<String>, String>("Check all that apply:", selectionType: .MultipleSelection)
        for option in guidedPracticeComponents {
            form.last! <<< ImageCheckRow<String>(option){ lrow in
                lrow.title = option
                lrow.selectableValue = option
                lrow.value = nil
                }.cellSetup { cell, _ in
                    cell.trueImage = UIImage(named: "CheckedBox")!
                    cell.falseImage = UIImage(named: "EmptyBox")!
                }
        }
        form +++
            Section("Responses")
        let responsesComponents = ["Individual", "Partner", "Small Group", "Whole Group"]
        form +++
            SelectableSection<ImageCheckRow<String>, String>("Responses. Check all that apply:", selectionType: .MultipleSelection)
        for option in responsesComponents {
            form.last! <<< ImageCheckRow<String>(option){ lrow in
                //lrow.title = option
                lrow.title = option
                lrow.selectableValue = option
                lrow.value = nil
                }.cellSetup { cell, _ in
                    cell.trueImage = UIImage(named: "CheckedBox")!
                    cell.falseImage = UIImage(named: "EmptyBox")!
            }
        }
        form +++
            Section("Teacher Feedback")
            <<< TextRow(){
                $0.title = " "
                $0.placeholder = "Enter Comments..."
            }
    
    }
    override func rowValueHasBeenChanged(row: BaseRow, oldValue: Any?, newValue: Any?) {
        if row.section === form[0] {
            print("Single Selection:\((row.section as! SelectableSection<ImageCheckRow<String>, String>).selectedRow()?.baseValue)")
        }
        else if row.section === form[1] {
            print("Mutiple Selection:\((row.section as! SelectableSection<ImageCheckRow<String>, String>).selectedRows().map({$0.baseValue}))")
        }
    }
}
public final class ImageCheckRow<T: Equatable>: Row<T, ImageCheckCell<T>>, SelectableRowType, RowType {
    public var selectableValue: T?
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}

public class ImageCheckCell<T: Equatable> : Cell<T>, CellType {
    
    required public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    lazy public var trueImage: UIImage = {
        return UIImage(named: "selected")!
    }()
    
    lazy public var falseImage: UIImage = {
        return UIImage(named: "unselected")!
    }()
    
    public override func update() {
        super.update()
        accessoryType = .None
        imageView?.image = row.value != nil ? trueImage : falseImage
    }
    
    public override func setup() {
        super.setup()
    }
    
    public override func didSelect() {
        row.reload()
        row.select()
        row.deselect()
    }
    
}


