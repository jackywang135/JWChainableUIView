

//: Examples

//: Making a simple Japanese Flag

import UIKit

let japaneseFlagView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 150, height: 100))).changeBackgroundColor(UIColor.whiteColor())

japaneseFlagView.initSubviewInCenter(classType: CircleView.self, size: CGSize(width: 50, height: 50))
    .changeBackgroundColor(UIColor.redColor())
    .changeAlpha(0.5)
    .scale(1.5)

japaneseFlagView


//: Making Mickey Mouse 

let mickyMouseView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 120, height: 120))).changeBackgroundColor(UIColor.whiteColor())

mickyMouseView.initSubviewInBottomCenter(classType: CircleView.self, size: CGSize(width: 80, height: 80))
    .changeBackgroundColor(UIColor.blackColor())
    .offSet(x: 0, y: -10)

mickyMouseView.initSubviewInTopLeft(classType: CircleView.self, size: CGSize(width: 35, height: 35))
    .changeBackgroundColor(UIColor.blackColor())
    .offSet(x: 10, y: 15)

mickyMouseView.initSubviewInTopRight(classType: CircleView.self, size: CGSize(width: 35, height: 35))
    .changeBackgroundColor(UIColor.blackColor())
    .offSet(x: -10, y: 15)


mickyMouseView



//: American flag

let americanFlagView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 1500, height: 1000)))
    .changeBackgroundColor(UIColor.whiteColor())

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

americanFlagView












