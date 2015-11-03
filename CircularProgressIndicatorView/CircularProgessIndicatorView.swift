//
//  CircularProgessIndicatorView.swift
//  CircularProgressIndicatorView
//
//  Created by Takeshi Tanaka on 11/3/15.
//  Copyright © 2015 p0dee. All rights reserved.
//

import UIKit
import Foundation

class CircularProgressIndicatorView : UIView {
    private let circle = CAShapeLayer()
    var progress: Double = 0.0 {
        didSet {
            circle.strokeEnd = CGFloat(progress)
        }
    }
    
    override var frame: CGRect {
        didSet {
            circle.path = circlePath()
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
        circle.path = circlePath()
        circle.strokeColor = UIColor.blackColor().CGColor
        circle.fillColor = UIColor.clearColor().CGColor
        circle.strokeEnd = 0.0
        self.layer.addSublayer(circle)
    }
    
    private func circlePath() -> CGPathRef {
        let rad: CGFloat = min(self.bounds.size.width, self.bounds.size.height) * 0.5
        let p = CGPathCreateMutable()
        CGPathAddArc(p, nil, self.bounds.size.width * 0.5, self.bounds.size.height * 0.5, rad, CGFloat(-M_PI_2), CGFloat(M_PI_2 * 3), false)
        return p
    }
}
