//
//  JWChainableUIViewExtension.swift
//  JWChainableUIView
//
//  Created by Jacky Wang on 11/26/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import UIKit

public enum HorizontalAlignment {
    case Left, Center, Right
}

public enum VerticalAlignment {
    case Top, Center, Bottom
}

public struct Alignments {
    
    let h: HorizontalAlignment
    let v: VerticalAlignment
}

public extension UIView {
    
    // Init
    
    func initSubview<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        let subview = cls.init(frame:CGRect(origin: CGPointZero, size: size))
        addSubview(subview)
        return subview
    }
    
    func addToSuperview(superview superview: UIView) -> Self {
        superview.addSubview(self)
        return self
    }
    
    // Offset
    
    func offSet(x x: CGFloat, y:CGFloat) -> Self {
        frame = CGRect(x: frame.origin.x + x, y: frame.origin.y + y, width: frame.width, height: frame.height)
        return self
    }
    
    //moveSubView
    
    func frame(frame: CGRect) -> Self {
        self.frame = frame
        return self
    }
    
    func align(alignment horizontalAlignment: HorizontalAlignment,_   verticalAlignment : VerticalAlignment) -> Self {
        
        switch (horizontalAlignment, verticalAlignment) {
            
        case (.Left, .Top):      return moveToTopLeft()
        case (.Left, .Center):   return moveToLeftCenter()
        case (.Left, .Bottom):   return moveToBottomLeft()
        case (.Center, .Top):    return moveToTopCenter()
        case (.Center, .Center): return moveToCenter()
        case (.Center, .Bottom): return moveToBottomCenter()
        case (.Right, .Top):     return moveToTopRight()
        case (.Right, .Center):  return moveToRightCenter()
        case (.Right, .Bottom):  return moveToBottomRight()
            
        }
    }
    
     //call moving from superview
    
    func moveSubviewToAlignment(subview view: UIView, horizontalAlignment: HorizontalAlignment, verticalAlignment: VerticalAlignment) -> Self {
         assert(self == view.superview, "Error: view is not a subview of a view")
        view.align(alignment: horizontalAlignment, verticalAlignment)
        return self
    }
    
    func moveSubviewToCenter(subview view: UIView) -> Self{
        assert(self == view.superview, "Error: view is not a subview of a view")
        view.moveToCenter()
        return self
    }
    
    func moveSubviewToTopLeft(subview view: UIView) {
        assert(self == view.superview, "Error: view is not a subview of a view")
        view.moveToTopLeft()
    }
    
    func moveSubviewToBottomLeft(subview view: UIView) {
        assert(self == view.superview, "Error: view is not a subview of a view")
        view.moveToBottomLeft()
    }
    
    func moveSubviewToTopRight(subview view: UIView) {
        assert(self == view.superview, "Error: view is not a subview of a view")
        view.moveToTopRight()
    }
    
    func moveSubviewToBottomRight(subview view: UIView) {
        assert(self == view.superview, "Error: view is not a subview of a view")
        view.moveToBottomRight()
    }
    
    // call moving directly on subviews
    
    func moveToCenter() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        
        frame = CGRect(x: (superview.frame.width - frame.width)/2, y: (superview.frame.height - frame.height)/2, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToTopLeft() -> Self {
        guard let _ = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToTopRight() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: superview.frame.width - frame.width, y: 0, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToTopCenter() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: (superview.frame.width - frame.width)/2, y: 0, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToBottomLeft() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: 0, y: superview.frame.height - frame.height, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToBottomRight() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: superview.frame.width - frame.width, y: superview.frame.height - frame.height, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToBottomCenter() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: (superview.frame.width - frame.width)/2, y: superview.frame.height - frame.height, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToLeftCenter() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: 0.0, y: (superview.frame.height - frame.height)/2, width: frame.width, height: frame.height)
        return self
    }
    
    func moveToRightCenter() -> Self {
        guard let superview = superview else {
            assertionFailure("Error: View does not have a superview")
            return self
        }
        frame = CGRect(x: superview.frame.width - frame.width, y: (superview.frame.height - frame.height)/2, width: frame.width, height: frame.height)
        return self
    }
    
    
    // Scaling view
    
    func scale(scalingRatio: CGFloat) -> Self {
        
        let centerPoint = center
        let newWidth = frame.width * scalingRatio
        let newHeight = frame.height * scalingRatio
        
        frame = CGRect(x: centerPoint.x - newWidth/2, y: centerPoint.y - newHeight/2, width: newWidth, height: newHeight)
        
        return self
    }
    
    // Color 
    
    func changeBackgroundColor(color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    // Alpha 
    
    func changeAlpha(alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    // Gesture 
    
    func addGesture(gestureRecognizer: UIGestureRecognizer) -> Self {
        addGestureRecognizer(gestureRecognizer)
        return self 
    }


    //Convenience methods chaining init -> addToSuperView -> move
    
    func initAddSubviewWithAlignment<U: UIView>(classType cls: U.Type, size: CGSize, alignments: Alignments) -> U {
        
        return initSubview(classType: cls, size: size)
            .align(alignment: alignments.h, alignments.v)
    }
    
    func initSubviewInCenter<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToCenter()
    }
    
    func initSubviewInTopLeft<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToTopLeft()
    }
    
    func initSubviewInBottomLeft<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToBottomLeft()
    }
    
    func initSubviewInTopRight<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToTopRight()
    }
    
    func initSubviewInBottomRight<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToBottomRight()
    }
    
    func initSubviewInBottomCenter<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToBottomCenter()
    }
    
    func initSubviewInTopCenter<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToTopCenter()
    }
    
    func initSubviewInLeftCenter<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToLeftCenter()
    }
    
    func initSubviewInRightCenter<U: UIView>(classType cls: U.Type, size: CGSize) -> U {
        return initSubview(classType: cls, size: size)
            .moveToRightCenter()
    }

}