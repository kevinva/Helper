//
//  HzScreen.swift
//  TaoLueFM
//
//  Created by ZanderHo on 16/3/6.
//  Copyright © 2016年 ZanderHo. All rights reserved.
//

import Foundation

enum HzScreenModel {
    
    enum ClassicModel {
        case Inch35
        case Inch4
    }
    
    case Classic(ClassicModel)
    case Bigger
    case BiggerPlus
}

struct HzScreen {
    static let screenModel: HzScreenModel = {
       
        let screenSize = UIScreen.mainScreen().currentMode?.size
        guard let size = screenSize else {
            print("Can not detect screen model")
            return .Bigger
        }
        
        let screenWidth = size.width
        switch screenWidth {
        
        case 2 * 320.0:
            let screenHeight = size.height
            return screenHeight > (2 * 480) ? .Classic(.Inch4) : .Classic(.Inch35)
        
        case 2 * 375.0:
            return .Bigger
            
        case 3 * 414.0:
            return .BiggerPlus
            
        default:
            print("Can not detect screen model")
            return .Bigger
        }
        
    }()
}