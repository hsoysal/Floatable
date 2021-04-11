//
//  FloatingProtocol.swift
//  FloatingTextField
//
//  Created by Hasan Soysal on 11.04.2021.
//

import Foundation
import UIKit

private let kFloatingInterfaceLabelTag = 103213

///It is a protocol in order to make UI floatable. You can customize your UI elements conforming to this protocol.
///`editingRect(ofBounds bounds: CGRect) -> CGRect` is for TextFields. It indicates the rect in which the user can edit the text with keyboard
///`textRect(ofBounds bounds: CGRect) -> CGRect` is for some UI elements like TextField, Label, Button. It indicates the rect in which the text of the element is being drawn.
///`textChanged(ofBounds bounds: CGRect)` is for some UI elements like TextField, Label, Button. The text of the element is being changed. It is the title for Buttons, or its the text for Labels and TextFields
///`inset` is the left and right padding. The floating label starts at the point that is away from the value of inset.
///`floating` stands for whether the floating feature is turned on/off.
///`floatingColor` is the color of floating label.
///`placeholder` is the text of floating label.
///`text` is the text of UI elements like TextField, Button, Label, UIView. If it is empty, there will be no floating label.
///`view` is the UI element that the floating label will be added its subview.
///`floatingFont` is the font of the floating label. The custom font can be assignable to it. And also the font pointsize can be set.
public protocol Floatable {
    
    func editingRect(ofBounds bounds: CGRect) -> CGRect
    func textRect(ofBounds bounds: CGRect) -> CGRect
    func textChanged(ofBounds bounds: CGRect)
    var inset: CGFloat { get set }
    var floating: Bool { get set }
    var floatingColor: UIColor? { get set }
    var placeholder: String? { get }
    var text: String? { get }
    var view: UIView { get }
    var floatingFont: UIFont? { get }
}

public extension Floatable {
    
    func editingRect(ofBounds bounds: CGRect) -> CGRect {
        
        let floatingEnabled: Bool = floating && placeholder != nil
        let leftRightInset: CGFloat = inset
        if !floatingEnabled && leftRightInset == 0 { return bounds }
        let textEmpty: Bool = self.text?.isEmpty ?? true
        if floatingEnabled && !textEmpty {
            let x: CGFloat = bounds.origin.x + leftRightInset
            let y: CGFloat = bounds.size.height/6
            let w: CGFloat = bounds.size.width - 2 * leftRightInset
            let h: CGFloat = bounds.size.height
            return CGRect(x: x, y: y, width: w, height: h)
        }
        return CGRect(x: bounds.origin.x + leftRightInset, y: 0, width: bounds.size.width - 2 * leftRightInset, height: bounds.size.height)
    }
    
    func textRect(ofBounds bounds: CGRect) -> CGRect {
        let floatingEnabled: Bool = floating && placeholder != nil
        let leftRightInset: CGFloat = inset
        if !floatingEnabled && leftRightInset == 0 { return bounds }
        let textEmpty: Bool = self.text?.isEmpty ?? true
        if floatingEnabled && !textEmpty {
            return CGRect(x: bounds.origin.x + leftRightInset, y: bounds.size.height/6, width: bounds.size.width - 2 * leftRightInset, height: bounds.size.height)
        }
        return CGRect(x: bounds.origin.x + leftRightInset, y: 0, width: bounds.size.width - 2 * leftRightInset, height: bounds.size.height)
    }
    
    func textChanged(ofBounds bounds: CGRect) {
        let floatingEnabled: Bool = floating && placeholder != nil
        if !floatingEnabled { return }
        let textEmpty: Bool = self.text?.isEmpty ?? true
        let enabled: Bool = !textEmpty
        let label = view.viewWithTag(kFloatingInterfaceLabelTag)
        if enabled {
            if label == nil {
                let leftRightInset: CGFloat = inset
                let floatingLabel = UILabel(frame: CGRect(x: bounds.origin.x + leftRightInset, y: bounds.size.height / 6, width: bounds.size.width - 2 * leftRightInset, height: bounds.size.height / 4))
                floatingLabel.font = floatingFont
                floatingLabel.textColor = floatingColor
                floatingLabel.isUserInteractionEnabled = false
                floatingLabel.tag = kFloatingInterfaceLabelTag
                floatingLabel.text = self.placeholder
                view.addSubview(floatingLabel)
            }
        } else {
            label?.removeFromSuperview()
        }
    }
}
