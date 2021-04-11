//
//  FloatingLabel.swift
//  FloatingTextField
//
//  Created by Hasan Soysal on 11.04.2021.
//

import Foundation
import UIKit

///Example of Floatable on UITextField
public class FloatingTextField: UITextField, Floatable {
    
    @IBInspectable public var inset: CGFloat = 0.0
    @IBInspectable public var floating: Bool = false
    @IBInspectable public var floatingColor: UIColor?
    public var floatingFont: UIFont? { font?.withSize(12) }
    public var view: UIView { self }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.addTarget(self, action: #selector(textChanged(_:)), for: UIControl.Event.editingChanged)
        if self.text != nil { textChanged(self) }
    }
    
    @objc func textChanged(_ sender: UITextField?) {
        textChanged(ofBounds: bounds)
    }
        
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return editingRect(ofBounds: bounds)
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(ofBounds: bounds)
    }

    public override var text: String? {
        get {
            return super.text
        }
        set {
            super.text = newValue
            textChanged(ofBounds: bounds)
        }
    }
}

///Example of Floatable on UILabel
public class FloatingLabel: UILabel, Floatable {
    
    @IBInspectable public var inset: CGFloat = 0.0
    @IBInspectable public var floating: Bool = false
    @IBInspectable public var floatingColor: UIColor?
    @IBInspectable public var floatingPlaceholder: String?
    public var view: UIView { self }
    public var placeholder: String? { floatingPlaceholder }
    public var floatingFont: UIFont? { font.withSize(12) }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if self.text != nil { textChanged(ofBounds: bounds) }
    }
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: textRect(ofBounds: rect))
    }
    
    public override var text: String? {
        get {
            return super.text
        }
        set {
            super.text = newValue
            textChanged(ofBounds: bounds)
        }
    }
}

///Example of Floatable on UIButton
public class FloatingButton: UIButton, Floatable {
    
    @IBInspectable public var inset: CGFloat = 0.0
    @IBInspectable public var floating: Bool = false
    @IBInspectable public var floatingColor: UIColor?
    @IBInspectable public var floatingPlaceholder: String?
    public var view: UIView { self }
    public var placeholder: String? { floatingPlaceholder }
    public var floatingFont: UIFont? { titleLabel?.font.withSize(12) }
    public var text: String? { title(for: .normal) }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if self.text != nil { textChanged(ofBounds: bounds) }
    }
    
    public override func contentRect(forBounds bounds: CGRect) -> CGRect {
        textRect(ofBounds: bounds)
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        textChanged(ofBounds: bounds)
    }
}

///Example of Floatable on UIView
public class FloatingView: UIView, Floatable {
    
    @IBInspectable public var inset: CGFloat = 0.0
    @IBInspectable public var floating: Bool = false
    @IBInspectable public var floatingColor: UIColor?
    @IBInspectable public var floatingPlaceholder: String?
    public var view: UIView { self }
    public var placeholder: String? { floatingPlaceholder }
    public var floatingFont: UIFont? { UIFont.systemFont(ofSize: 12) }
    public var text: String? { "some" }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        if placeholder != nil { textChanged(ofBounds: bounds) }
    }
}
