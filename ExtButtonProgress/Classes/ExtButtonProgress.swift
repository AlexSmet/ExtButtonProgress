//
//  ExtButtonProgress.swift
//
//
//  This simple extension adds a progress indicator to circular UIButton
//
//  Use method showProgressIndicator( width:color:backgroundColor:) to begin show progress indicator
//  and method hideProgressIndicator() to hide indicator
//
//
//  Created by Alexander Smetannikov (alexsmetdev@gmail.com) on 17/03/2017.
//  Thanks to Evgeny Safronov
//  Copyright © 2017 AlexSmetannikov. All rights reserved.


import UIKit

public extension UIButton {
    
    class SHProgressIndicator: UIView {
        
        var width: CGFloat = 5.0
        var color: UIColor = UIColor.darkGray
        var shadowColor: UIColor = UIColor.lightGray
        var animationDuration: CFTimeInterval = 3.0
        
        private let indicatorLayer = CAShapeLayer()
    
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            layer.addSublayer(indicatorLayer)
        }
        
        public required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            
            layer.addSublayer(indicatorLayer)
        }
        
        
        private func setLayer(_ aLayer: CAShapeLayer, srokeColor: UIColor, background: UIColor, start: CGFloat, end: CGFloat) {
            aLayer.frame = self.bounds
            aLayer.path = UIBezierPath(ovalIn: aLayer.bounds.insetBy(dx: width / 2.0, dy: width / 2.0 )).cgPath
            aLayer.lineWidth = width
            aLayer.backgroundColor = background.cgColor
            aLayer.fillColor = background.cgColor
            aLayer.strokeColor = srokeColor.cgColor
            aLayer.strokeStart = start
            aLayer.strokeEnd = end
            aLayer.setAffineTransform(CGAffineTransform(rotationAngle: -(CGFloat.pi / 2.0)))
        }
        
        fileprivate func startAnimation() {
            // make animation
            setLayer(indicatorLayer, srokeColor: color, background: shadowColor, start: 0, end: 0)
            let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
            strokeEndAnimation.fromValue = 0
            strokeEndAnimation.toValue = 1
            strokeEndAnimation.duration = animationDuration / 2
            indicatorLayer.strokeEnd = 1
            
            let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
            strokeStartAnimation.beginTime = strokeEndAnimation.duration
            strokeStartAnimation.fromValue = 0
            strokeStartAnimation.toValue = 1
            strokeStartAnimation.duration = animationDuration / 2
            
            let group = CAAnimationGroup()
            group.animations = [strokeEndAnimation, strokeStartAnimation]
            group.duration = animationDuration
            group.autoreverses = false
            group.repeatCount = HUGE
            
            indicatorLayer.add(group, forKey: nil)
        }
    }
    
    private func indicator(frame: CGRect) -> UIView {
        let indicator = SHProgressIndicator(frame: frame)
        return indicator
    }
    
    
    // Show progress indicator. Just set width, foreground and background colors for progress indicator, and animation duration
    public func showProgressIndicator( width: CGFloat, color: UIColor, backgroundColor: UIColor, cycleDuration: CFTimeInterval = 3.0){
        guard let superview = superview else {
            print("First of all add a button")
            return
        }
        
        if let _ = superview.subviews.index(where: {$0 is SHProgressIndicator}) {
            print("Indicator already exist")
            return
        }
        
        let buttonFrame = frame
        
        let indicatorFrame = CGRect(x: buttonFrame.minX, y: buttonFrame.minY, width: buttonFrame.width + width * 2, height: buttonFrame.height + width * 2)
        let indicator = self.indicator(frame: indicatorFrame) as! SHProgressIndicator
        indicator.center = center
        indicator.layer.cornerRadius = 0.5 * indicator.bounds.size.width
        indicator.clipsToBounds = true
        indicator.width = width
        indicator.color = color
        indicator.shadowColor = backgroundColor
        indicator.animationDuration = cycleDuration
        
        superview.addSubview(indicator)
        
        let indicatorIndex = superview.subviews.index(where: {$0 is SHProgressIndicator})
        let buttonIndex = superview.subviews.index(where: {$0 == self})
        
        superview.exchangeSubview(at: buttonIndex!, withSubviewAt: indicatorIndex!)
        
        indicator.startAnimation()
    }
    
    // Hide indicator
    public func hideProgressIndicator(){
        if let indicator = superview?.subviews.first(where: {$0 is SHProgressIndicator}) {
            indicator.removeFromSuperview()
        }
    }
    
    public var isProgressIndicatorVisible: Bool {
        return superview?.subviews.first(where: {$0 is SHProgressIndicator}) != nil
    }
}
