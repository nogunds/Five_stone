//
//  FiveStoneCollectionViewCell.swift
//  five_stone
//
//  Created by hyh on 05/09/2018.
//  Copyright © 2018 hyh. All rights reserved.
//

import UIKit

class FiveStoneCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var whiteStone: UIView!
    @IBOutlet var blackStone: UIView!
    
    var stone:Stone?
    
    override func awakeFromNib() {
        setStoneShape()
    }
    
    func setStoneShape(){
        whiteStone.layer.borderColor = UIColor.black.cgColor
        whiteStone.layer.borderWidth = 0.5
        whiteStone.layer.cornerRadius = self.frame.size.width/2
        
        blackStone.layer.borderColor = whiteStone.layer.borderColor
        blackStone.layer.borderWidth = whiteStone.layer.borderWidth
        blackStone.layer.cornerRadius = whiteStone.layer.cornerRadius
    }
    
    func setStone(stone:Stone){
        self.stone = stone
        
        setStoneType(type: stone.type)
    }
    
    func setStoneType(type:StoneType){
        if stone != nil{
            stone?.type = type
            
            whiteStone.isHidden = true
            blackStone.isHidden = true
            
            if(type == StoneType.StoneType_White){
                whiteStone.isHidden = false
            }
            else if(type == StoneType.StoneType_Black){
                blackStone.isHidden = false
            }
        }
    }
}
