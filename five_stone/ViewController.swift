//
//  ViewController.swift
//  five_stone
//
//  Created by hyh on 04/09/2018.
//  Copyright © 2018 hyh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet var fiveStoneBase: FiveStoneBase!
    @IBOutlet var fiveStoneCollectionView: UICollectionView!
    var fiveStoneController:FiveStoneController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fiveStoneController = FiveStoneController.init(turn: StoneType.StoneType_White)
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    //row
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (fiveStoneController?.MAX_ROW_STONE_COUNT)!
    }
    
    //section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (fiveStoneController?.MAX_ROW_STONE_COUNT)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let stone: Stone = (fiveStoneController?.getStoneByIndexPath(indexPath: indexPath))!
        
        let cell:FiveStoneCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "whiteCell", for: indexPath) as! FiveStoneCollectionViewCell
        
        cell.setStone(stone: stone)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let baseSize:CGSize = collectionView.frame.size
        
        let size: CGSize = CGSize.init(width: baseSize.width/CGFloat((fiveStoneController?.MAX_ROW_STONE_COUNT)!), height: baseSize.height/CGFloat((fiveStoneController?.MAX_ROW_STONE_COUNT)!))
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell:FiveStoneCollectionViewCell = collectionView.cellForItem(at: indexPath) as!FiveStoneCollectionViewCell
        
        if cell.stone?.type == StoneType.StoneType_None{
            cell.setStoneType(type: (fiveStoneController?.turn)!)
            fiveStoneController?.changeTurn()
            
            let isFiveStone = fiveStoneController?.isFiveStone(nowStone: cell.stone!)
            
            if isFiveStone == true{
                collectionView.allowsSelection = false
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

