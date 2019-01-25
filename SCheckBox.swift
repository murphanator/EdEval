//
//  SCheckBox.swift
//  EdEval
//
//  Created by Capital High on 2/23/16.
//  Copyright © 2016 Capital High. All rights reserved.
//

import UIKit

class SCheckBox: UIControl {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    let textLabel = UILabel()
    fileprivate let DefaultSideLength = CGFloat(20.0)
    fileprivate var colors = [UInt: UIColor]()
    fileprivate var backgroundColors = [UInt: UIColor]()
    var checkboxSideLength = CGFloat(0.0)
    
    var checkboxColor:UIColor = UIColor.black {
        didSet {
            self.textLabel.textColor = self.checkboxColor
            self.setNeedsDisplay()
        }
    }
    
    var checked:Bool = false {
        didSet {
            self.setNeedsDisplay()
            self.sendActions(for: UIControlEvents.valueChanged)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.textLabel.frame = CGRect.zero
        self.checkboxSideLength = DefaultSideLength
        self.checkboxColor = UIColor.black
        self.backgroundColor = UIColor.clear
        self.textLabel.backgroundColor = UIColor.clear
        
        self.addSubview(self.textLabel)
        
        self.addObserver(self, forKeyPath: "enabled", options: NSKeyValueObservingOptions.new, context: nil)
        self.addObserver(self, forKeyPath: "selected", options: NSKeyValueObservingOptions.new, context: nil)
        self.addObserver(self, forKeyPath: "highlighted", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    func color(_ color:UIColor, forState state:UIControlState) {
        self.colors[state.rawValue] = color
        self.changeColorForState(self.state)
    }
    
    func backgroundColor(_ color:UIColor, forState state:UIControlState) {
        
        self.backgroundColors[state.rawValue] = color
        self.changeBackgroundColorForState(self.state)
    }
    
    deinit {
        self.removeObserver(self, forKeyPath: "enabled")
        self.removeObserver(self, forKeyPath: "selected")
        self.removeObserver(self, forKeyPath: "highlighted")
    }
    
    
    override func observeValue(forKeyPath keyPath: String!, of object: Any!, change: [NSKeyValueChangeKey : Any]!, context: UnsafeMutableRawPointer?) {
        switch keyPath {
        case "enabled", "selected", "highlighted":
            self.changeColorForState(self.state)
            
        default:
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    fileprivate func changeColorForState(_ state: UIControlState) {
        
        if let color = self.colors[state.rawValue] {
            self.checkboxColor = color
            self.textLabel.textColor = color
        }
    }
    
    fileprivate func changeBackgroundColorForState(_ state: UIControlState) {
        
        if let color = self.backgroundColors[state.rawValue] {
            self.backgroundColor = color
        }
    }
    
    override func draw(_ rect: CGRect) {
        let frame = CGRect(x: 0, y: (rect.size.height - self.checkboxSideLength) / 2.0, width: self.checkboxSideLength, height: self.checkboxSideLength).integral
        
        if self.checked {
            let bezierPath = UIBezierPath()
            
            bezierPath.move(to: CGPoint(x: frame.minX + 0.75000 * frame.width, y: frame.minY + 0.21875 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.40000 * frame.width, y: frame.minY + 0.52500 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.28125 * frame.width, y: frame.minY + 0.37500 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.17500 * frame.width, y: frame.minY + 0.47500 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.40000 * frame.width, y: frame.minY + 0.75000 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.81250 * frame.width, y: frame.minY + 0.28125 * frame.height))
            bezierPath.addLine(to: CGPoint(x: frame.minX + 0.75000 * frame.width, y: frame.minY + 0.21875 * frame.height))
            bezierPath.close()
            
           // self.checkboxColor.setFill()
            
            //Change the Little checkmark to Red
            UIColor.red.setFill()
            self.checkboxColor.setStroke()
            
            bezierPath.fill()
        }
        
        let roundedRectanglePath = UIBezierPath(roundedRect: CGRect(x: frame.minX + floor(frame.width * 0.05000 + 0.5), y: frame.minY + floor(frame.height * 0.05000 + 0.5), width: floor(frame.width * 0.95000 + 0.5) - floor(frame.width * 0.05000 + 0.5), height: floor(frame.height * 0.95000 + 0.5) - floor(frame.height * 0.05000 + 0.5)), cornerRadius: 0.0)
        
        roundedRectanglePath.lineWidth = 2 * self.checkboxSideLength / DefaultSideLength
        self.checkboxColor.setStroke()
        roundedRectanglePath.stroke()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let textLabelOriginX = self.checkboxSideLength + 5.0
        _ = CGSize(width: self.bounds.width - textLabelOriginX, height: self.bounds.height)
        
        print(self.textLabel.text)
      
        let myNSString: NSString = NSString(string: self.textLabel.text!)
        
        let textLabelSize:CGSize =  myNSString.size(attributes: [NSFontAttributeName: self.textLabel.font])
        self.textLabel.frame = CGRect(x: textLabelOriginX, y: (self.bounds.height - textLabelSize.height) / 2.0, width: textLabelSize.width, height: textLabelSize.height).integral
        
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        let location = touch!.location(in: self)
        if self.bounds.contains(location) {
            self.checked = !self.checked
        }
    }
}


