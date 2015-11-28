# JWChainableUIView

JWChainableUIView allows you to **chain** functions of initialization, addSubview, customization your UIView. 

Making it simpler to create and layout subviews, **avoiding messy frame calculations.**

## Examples : 

### Making a Japanese Flag
```

japaneseFlagView.initSubviewInCenter(classType: CircleView.self, size: CGSize(width: 50, height: 50))
    .changeBackgroundColor(UIColor.redColor())
    .changeAlpha(0.5)

```
![Japanese Flag](https://cloud.githubusercontent.com/assets/8235878/11451013/5dfd8df4-95f0-11e5-8a0a-26f488241138.png)


### Making Mickey Mouse 
```
mickyMouseView.initSubviewInBottomCenter(classType: CircleView.self, size: CGSize(width: 80, height: 80))
    .changeBackgroundColor(UIColor.blackColor())
    .offSet(x: 0, y: -10)

mickyMouseView.initSubviewInTopLeft(classType: CircleView.self, size: CGSize(width: 35, height: 35))
    .changeBackgroundColor(UIColor.blackColor())
    .offSet(x: 10, y: 15)

mickyMouseView.initSubviewInTopRight(classType: CircleView.self, size: CGSize(width: 35, height: 35))
    .changeBackgroundColor(UIColor.blackColor())
    .offSet(x: -10, y: 15)
```

![Mickey Mouse](https://cloud.githubusercontent.com/assets/8235878/11451000/310306d0-95f0-11e5-9d0f-1b1bdab61e86.png)


### Making an American Flag
```
let stripeHeight: CGFloat = 1000.0 / 13

for index in 0..<13 {

    let redStripe = americanFlagView.initSubview(classType: UIView.self, size: CGSize(width: 1500, height: stripeHeight))
        .offSet(x: 0, y: CGFloat(index) * stripeHeight)
    
    if index % 2 == 0 {
        redStripe.changeBackgroundColor(UIColor.redColor())
    }
}

let bluePart = americanFlagView.initSubviewInTopLeft(classType: UIView.self, size: CGSize(width: 500, height: 500))
    .changeBackgroundColor(UIColor.blueColor())

for index in 0..<49 {
    
    let y = CGFloat(index / 7) * 500.0 / 7
    let x = CGFloat(index % 7) * 500.0 / 7
    
    bluePart.initSubview(classType: StarView.self, size: CGSize(width: 50, height: 50))
    .offSet(x: x, y: y)  
}
```
![American Flag](https://cloud.githubusercontent.com/assets/8235878/11451002/317285a0-95f0-11e5-934d-354c0af6d7b1.png)

##Usage :

**Chaining:**

```
view.initSubview(classType: UIView.self, size: CGSize(width: 50, height: 50))
    .changeAlpha(0.5)
    .changeBackgroundColor(UIColor.blackColor())
    .align(alignment: .Right, .Bottom)
    .offSet(x: 15, y: 15)

```
**Alignment:**

```
public enum HorizontalAlignment {
    case Left, Center, Right
}

public enum VerticalAlignment {
    case Top, Center, Bottom
}

//Align view in the top left corner of superview 

view.align(alignment: .Left, .Top)
    

```
**Moving:**
```
    view.moveToCenter()
    
    view.moveToTopLeft()
    view.moveToTopRight()
    view.moveToTopCenter()
    view.moveToBottomLeft()
    view.moveToBottomRight()
    view.moveToBottomCenter()
    view.moveToLeftCenter()
    view.moveToRightCenter()

```

**Scaling:**

```
    //Scales the view based on its center.
    
    view.scale(2.0)
```

**Convenience initializers make it even simpler to initialize your subview exactly where you want in one line.**

```
    view.initSubviewInCenter(classType: CircleView.self, size: size)
    view.initSubviewInTopLeft(classType: CircleView.self, size: size)
    view.initSubviewInTopRight(classType: CircleView.self, size: size)
    view.initSubviewInTopCenter(classType: CircleView.self, size: size)
    view.initSubviewInBottomLeft(classType: CircleView.self, size: size)
    view.initSubviewInBottomRight(classType: CircleView.self, size: size)
    view.initSubviewInBottomCenter(classType: CircleView.self, size: size)
    view.initSubviewInLeftCenter(classType: CircleView.self, size: size)
    view.initSubviewInRightCenter(classType: CircleView.self, size: size)

```

##Installation

1. Download the project.
2. Open the "JWChainableUIView.playground" if you want to play around and experiment with the methods. All examples above are included in the playground. 
3. Copy the "JWChainableUIViewExtension.swift" from the "Sources" folder and add it to the project you want to use it in. 
