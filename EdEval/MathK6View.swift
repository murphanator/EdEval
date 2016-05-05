//
//  MathK6View.swift
//  EdEval
//
//  Created by Capital High on 5/3/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

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
            let mathComponents = ["addition", "subtraction", "Multiplication", "Divide"]
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
                $0.title = "Observed Time in Text"
                $0.value = true
                }
            <<< SegmentedRow<String>(){
                $0.title = "Minutes Observed"
                $0.options = ["< 1 minute", "1 to 2 minutes", "> 2 minutes"]
                $0.value = "> 2 minutes"
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


