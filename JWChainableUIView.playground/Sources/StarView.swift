import Foundation
import UIKit
import CoreGraphics

public class StarView: UIView {
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createStarPath(CGSize(width: frame.width, height: frame.height))
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.fillColor = UIColor.whiteColor().CGColor
        shapeLayer.fillRule = kCAFillRuleNonZero
        shapeLayer.path = createStarPath(CGSize(width: frame.width, height: frame.height))
        layer.addSublayer(shapeLayer)
    }

    func createStarPath(size: CGSize) -> CGPath {
        let numberOfPoints: CGFloat = 5
        
        let starRatio: CGFloat = 0.5
        
        let steps: CGFloat = numberOfPoints * 2
        
        let outerRadius: CGFloat = min(size.height, size.width) / 2
        let innerRadius: CGFloat = outerRadius * starRatio
        
        let stepAngle = CGFloat(2) * CGFloat(M_PI) / CGFloat(steps)
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        
        let path = CGPathCreateMutable()
        
        for i in 0..<Int(steps) {
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            
            let angle = CGFloat(i) * stepAngle - CGFloat(M_PI_2)
            
            let x = radius * cos(angle) + center.x
            let y = radius * sin(angle) + center.y
            
            if i == 0 {
                CGPathMoveToPoint(path, nil, x, y)
            }
            else {
                CGPathAddLineToPoint(path, nil, x, y)
            }
        }
        
        CGPathCloseSubpath(path)
        return path
    }
}