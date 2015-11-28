import Foundation
import UIKit 

public class CircleView: UIView {
    
    override public func layoutSubviews() {
        layer.cornerRadius = frame.width / 2
    }
}