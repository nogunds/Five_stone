//
//  FiveStoneController.swift
//  five_stone
//
//  Created by hyh on 05/09/2018.
//  Copyright © 2018 hyh. All rights reserved.
//

import Foundation

class FiveStoneController{
    let MAX_ROW_STONE_COUNT:Int = 15
    var stoneArray:Array<Array<Stone>>?
    var turn:StoneType = StoneType.StoneType_White
    
    init(turn:StoneType) {
        self.turn = turn
        
        if turn == StoneType.StoneType_None{
            self.turn = StoneType.StoneType_White
        }
        
        makeStoneArray()
    }
    
    func makeStoneArray(){
        stoneArray = Array.init()
        for section in 0...MAX_ROW_STONE_COUNT - 1{
            var rowArray:Array<Stone> = Array.init()
            
            for row in 0...MAX_ROW_STONE_COUNT - 1{
                let indexPath:IndexPath = IndexPath.init(row: row, section: section)
                let stone:Stone = Stone.init(stoneType: StoneType.StoneType_None, indexPath: indexPath)
                rowArray.append(stone)
            }
            
            stoneArray?.append(rowArray)
        }
    }
    
    func getStoneByIndexPath(indexPath:IndexPath) -> Stone{
        let rowArray:Array<Stone> = stoneArray![indexPath.section]
        let stone:Stone = rowArray[indexPath.row]
        
        return stone
    }
    
    func changeTurn(){
        if turn == StoneType.StoneType_White {
            turn = StoneType.StoneType_Black
        }
        else if turn == StoneType.StoneType_Black{
            turn = StoneType.StoneType_White
        }
    }
    
    func isFiveStone(nowStone:Stone) -> Bool{
        var isFive:Bool = false
        
        let indexPath = nowStone.indexPath
        var willFindPath = indexPath
        var findCount = 1
        
        for section in -1...1{
            for row in -1...1{
                findCount = 1
                willFindPath.row += row
                
                while findCount != 5{
                    let oldFindPath = willFindPath
                    
                    if willFindPath.row >= 0 && willFindPath.row <= MAX_ROW_STONE_COUNT{
                        if willFindPath.section >= 0 && willFindPath.section <= MAX_ROW_STONE_COUNT{
                            let isSameColor = isSameColorStone(firstIndexPath: indexPath, secondIndexPath: willFindPath)
                            
                            if isSameColor == true{
                                findCount = findCount + 1
                                if willFindPath.row != indexPath.row {
                                    willFindPath.row += row
                                }
                                
                                if willFindPath.section != indexPath.section {
                                    willFindPath.section += section
                                }
                            }
                            else{
                                willFindPath = oldFindPath
                                break
                            }
                            
                            if findCount == 5 {
                                isFive = true
                                break
                            }
                        }
                        else{
                            willFindPath = oldFindPath
                            break
                        }
                    }
                    else{
                        willFindPath = oldFindPath
                        break
                    }
                }
                
                if isFive == true {
                    break
                }
                
                willFindPath = indexPath
            }
            
            if isFive == true {
                break
            }
            
            willFindPath.section += section
            
        }
        
        
        
        
        return isFive
    }
    
    func isSameColorStone(firstIndexPath:IndexPath, secondIndexPath:IndexPath) -> Bool{
        var result:Bool = false
        
        if firstIndexPath.row != secondIndexPath.row || firstIndexPath.section != secondIndexPath.section{
            let firstStone = getStoneByIndexPath(indexPath: firstIndexPath)
            let secondStone = getStoneByIndexPath(indexPath: secondIndexPath)
            
            if firstStone.type == secondStone.type{
                result = true
            }
        }
        
        return result
    }
}
