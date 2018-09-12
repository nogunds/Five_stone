//
//  Stone.swift
//  five_stone
//
//  Created by hyh on 05/09/2018.
//  Copyright © 2018 hyh. All rights reserved.
//

import Foundation

enum StoneType:Int {
    case StoneType_None = 0
    case StoneType_White
    case StoneType_Black
}


class Stone {
    var type:StoneType
    var indexPath:IndexPath
    
    init(stoneType:StoneType, indexPath:IndexPath) {
        self.type = stoneType
        self.indexPath = indexPath
    }
}
