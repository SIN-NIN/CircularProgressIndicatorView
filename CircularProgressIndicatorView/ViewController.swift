//
//  ViewController.swift
//  CircularProgressIndicatorView
//
//  Created by Takeshi Tanaka on 11/3/15.
//  Copyright © 2015 p0dee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let progressIndicator = CircularProgressIndicatorView()
    let badExpampleIndicator = BadExampleIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .System)
        button.setTitle("Change Progress Discretely", forState: .Normal)
        button.addTarget(self, action: "changeProgress", forControlEvents: .TouchUpInside)
        button.sizeToFit()
        button.center = CGPointMake(self.view.center.x, 100)
        self.view.addSubview(button)
        
        let slider = UISlider()
        var sliderRect = slider.frame
        sliderRect.origin = CGPointMake(self.view.center.x - 70 - 10, CGRectGetMaxY(button.frame) + 10)
        sliderRect.size.width = 70 * 2 + 10 * 2
        slider.frame = sliderRect
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.addTarget(self, action: "sliderDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(slider)
        
        progressIndicator.frame = CGRectMake(self.view.center.x - 70 - 10, CGRectGetMaxY(slider.frame) + 10, 70, 70)
        progressIndicator.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.05)
        self.view.addSubview(progressIndicator)
        badExpampleIndicator.frame = CGRectMake(self.view.center.x + 10, CGRectGetMaxY(slider.frame) + 10, 70, 70)
        badExpampleIndicator.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.05)
        self.view.addSubview(badExpampleIndicator)
    }
    
    @objc private func changeProgress() {
        let val = Double(rand() % 20) / 20
        progressIndicator.progress = val
        badExpampleIndicator.progress = val
    }
    
    @objc private func sliderDidChange(sender: UISlider) {
        progressIndicator.progress = Double(sender.value)
        badExpampleIndicator.progress = Double(sender.value)
    }
    
}

