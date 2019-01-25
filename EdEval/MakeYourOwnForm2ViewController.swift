//
//  MakeYourOwnForm2ViewController.swift
//  EdEval
//
//  Created by Capital High on 8/16/16.
//  Copyright © 2016 Capital High. All rights reserved.
//



import UIKit
import Eureka

//class ViewController: FormViewController{

class MakeYourOwnForm2ViewController: FormViewController {
    var intRows = [String:[IntRow]]()
    var indexOfSection = 0 as Int
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Initializes the form with the first section
        insertSection()
        
    }
    
    //@IBAction func insertSection() {
    @IBAction func insertSection() {

        let sectionTag = "sectionTag\(indexOfSection)"
        let section = Section(){
            $0.tag = sectionTag
        }
        
        section <<< TextRow(){
            $0.title = "Made a new Section!!!"
        }
        
        intRows[section.tag!] = [IntRow]()
        
        //Row to show how form can be extended
        manageIntRowsInSection(section)
        section <<< TextRow(){
            $0.tag = "textRow\(section.tag)"
            $0.title = "Continue Form"
        }
        
        //Row to remove the section
        section <<< ButtonRow(){
            
            $0.tag = "buttonRow\(section.tag)"
            $0.title = "Delete Section"
            $0.onCellSelection({ cell, row in
                if let  indexOfSection = self.form.index(of: section){
                    self.form.remove(at: indexOfSection)
                }
            })
        }
        form +++ section
        // indexOfSection is used to avoid sections with the same tag
        indexOfSection = indexOfSection + 1
    }
    
    //where the magic happens...
    //func manageIntRowsInSection(var section: Section?){
        
    func manageIntRowsInSection(_ section: Section? ){
        var section = section
        if section != nil{
            //Adding IntRow to represent the number of IntRows will be inserted after it.
            section! <<< IntRow("\(section!.tag)_quantityRow"){
                $0.title = "Quantity of Rows"
                //Called everytime the value of the rows is changed
                $0.onChange({ [unowned self] row in
                    if let rowValue = row.value{
                        if let sectionTag = row.section?.tag{
                            if var  sectionIntRowsCount = self.intRows[sectionTag]?.count{
                                //Following constant defines how many rows need to be inserted or removed
                                let differenceBetweenNumberAndRows = rowValue - sectionIntRowsCount
                                if differenceBetweenNumberAndRows > 0 {
                                    //Insert the rows on the end of the section
                                    for _ in abs(differenceBetweenNumberAndRows){
                                        let intRow = IntRow("\(sectionTag)_intRow\(sectionIntRowsCount)")
                                        intRow.title = "Int"
                                        let index = section!.index(of: row)! + sectionIntRowsCount + 1
                                        section!.insert(intRow, at: index)
                                        self.intRows[sectionTag]?.append(intRow)
                                        sectionIntRowsCount = sectionIntRowsCount + 1
                                    }
                                    
                                    //remove the rows
                                }else if differenceBetweenNumberAndRows < 0 {
                                    var rows = self.intRows[sectionTag]
                                    for _ in abs(differenceBetweenNumberAndRows){
                                        if let lastIntRow = rows!.last {
                                            if let lastIntRowIndex = section?.index(of: lastIntRow){
                                                section?.remove(at: lastIntRowIndex)
                                                rows!.removeLast()
                                            }
                                        }
                                    }
                                    self.intRows[sectionTag] = rows!
                                }
                            }
                        }
                    }else{
                        //If the value is not informed, removes all the intRows
                        if let sectionTag = row.section?.tag{
                            if var rowsToRemove = self.intRows[sectionTag]{
                                
                                for intRow in rowsToRemove{
                                    if let indexToRemove = row.section?.index(of: intRow){
                                        row.section?.remove(at: indexToRemove)
                                    }
                                }
                                
                                rowsToRemove.removeAll()
                                self.intRows[sectionTag] = rowsToRemove
                            }
                            
                        }
                    }
                    
                    })
            }}
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

// Int extension to allow this: for _ in abs(differenceBetweenNumberAndRows)
extension Int : Sequence {
    public func makeIterator() -> IndexingIterator<Int> {
        return (0..<self).makeIterator()
    }
}





/******************************************************************
import UIKit

class MakeYourOwnForm2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
***********************************************************************/
