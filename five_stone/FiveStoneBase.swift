//
//  FiveStoneBase.swift
//  five_stone
//
//  Created by hyh on 04/09/2018.
//  Copyright © 2018 hyh. All rights reserved.
//

import UIKit

class FiveStoneBase: UIView {
    let MAX_RECTANGLE = 14
    
    var layerArray: NSArray?
    
    override func awakeFromNib() {
        makeFiveStoneLayer()
    }
    
    func makeFiveStoneLayer(){
        for columns in 0...MAX_RECTANGLE{
            var rectangleLayer: CALayer
            rectangleLayer = CALayer()
            rectangleLayer.frame = CGRect.init(origin: CGPoint.init(x: (CGFloat(columns) * self.frame.size.width / CGFloat(MAX_RECTANGLE)), y: 0), size: CGSize.init(width: 1, height: self.frame.size.height))
            rectangleLayer.backgroundColor = UIColor.black.cgColor
            
            self.layer.addSublayer(rectangleLayer);
        }
        
        for row in 0...MAX_RECTANGLE{
            var rectangleLayer: CALayer
            rectangleLayer = CALayer()
            rectangleLayer.frame = CGRect.init(origin: CGPoint.init(x: 0, y: (CGFloat(row) * self.frame.size.height / CGFloat(MAX_RECTANGLE))), size: CGSize.init(width: self.frame.size.width, height: 1))
            rectangleLayer.backgroundColor = UIColor.black.cgColor
            
            self.layer.addSublayer(rectangleLayer)
        }
    }
    
    func getARectangleSize() -> CGSize {
        let size:CGSize = CGSize.init(width: self.frame.size.width / CGFloat(MAX_RECTANGLE), height: self.frame.size.height / CGFloat(MAX_RECTANGLE))
        
        return size
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
