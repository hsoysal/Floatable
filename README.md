# Floatable
Floatable is a 100% Swift framework to make UI elements having floating feature. 

It is a protocol in order to make UI floatable. You can customize your UI elements conforming to this protocol. 


```swift
func editingRect(ofBounds bounds: CGRect) -> CGRect
```
It is for TextFields. It indicates the rect in which the user can edit the text with keyboard


```swift
func textRect(ofBounds bounds: CGRect) -> CGRect
```
It is for some UI elements like TextField, Label, Button. It indicates the rect in which the text of the element is being drawn.


```swift
func textChanged(ofBounds bounds: CGRect)
```
It is for some UI elements like TextField, Label, Button. The text of the element is being changed. It is the title for Buttons, or its the text for Labels and TextFields 


```swift
func textChanged(ofBounds bounds: CGRect)
```
It is for some UI elements like TextField, Label, Button. The text of the element is being changed. It is the title for Buttons, or its the text for Labels and TextFields 


```swift
var inset
```
It is the left and right padding. The floating label starts at the point that is away from the value of inset. 


```swift
var floating
```
It is for whether the floating feature is turned on/off.


```swift
var floatingColor
```
It is the color of floating label. 


```swift
var placeholder
```
It is the text of floating label. 


```swift
var text
```
It is the text of UI elements like TextField, Button, Label, UIView. If it is empty, there will be no floating label.


```swift
var view
```
It is the UI element that the floating label will be added its subview. 


```swift
var floatingFont
```
It is the font of the floating label. The custom font can be assignable to it. And also the font pointsize can be set.



# Examples of Floatable UIs
See FloatableUserInterfaces file in the package

![Floatables](https://user-images.githubusercontent.com/11644471/114317605-8e5ad980-9b11-11eb-8432-b0a875bd7f00.png)
