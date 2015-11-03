//
//  BadExampleIndicatorView.swift
//  CircularProgressIndicatorView
//
//  Created by Takeshi Tanaka on 11/3/15.
//  Copyright © 2015 p0dee. All rights reserved.
//

import UIKit

class BadExampleIndicatorView : UIView {
    let circle = CAShapeLayer()
    var progress: Double = 0.0 {
        didSet {
            let animation = CABasicAnimation()
            animation.fromValue = circle.path
            animation.toValue = progressPath(progress)
            circle.addAnimation(animation, forKey: "path")
            circle.path = progressPath(progress)
        }
    }
    
    override var frame: CGRect {
        didSet {
            circle.path = progressPath(progress)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCircularLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCircularLayer()
    }
    
    private func setupCircularLayer() {
        circle.strokeColor = UIColor.blackColor().CGColor
        circle.fillColor = UIColor.clearColor().CGColor
        circle.path = progressPath(0.0)
        self.layer.addSublayer(circle)
    }
    
    private func progressPath(progress: Double) -> CGPathRef {
        let rad: CGFloat = min(self.bounds.size.width, self.bounds.size.height) * 0.5
        let p = CGPathCreateMutable()
        CGPathMoveToPoint(p, nil, self.bounds.size.width * 0.5, self.bounds.size.height * 0.5 - rad)
        CGPathAddArc(p, nil, self.bounds.size.width * 0.5, self.bounds.size.height * 0.5, rad, CGFloat(-M_PI_2), CGFloat(-M_PI_2 + M_PI * 2 * progress), false)
        return p
    }
}
