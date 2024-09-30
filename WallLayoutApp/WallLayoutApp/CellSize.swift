//
//  CellSize.swift
//  WallLayoutApp
//
//  Created by Cesar Giupponi on 30/09/24.
//

import Foundation

enum CellSize {
    case twoByTwo
    case oneByTwo
    case twoByOne
    case oneByOne
    case threeByTwo

    // Returns the width multiplier based on the size
    var widthMultiplier: Int {
        switch self {
        case .twoByTwo, .twoByOne:
            return 2
        case .oneByTwo, .oneByOne:
            return 1
        case .threeByTwo:
            return 3
        }
    }

    // Returns the height multiplier based on the size
    var heightMultiplier: Int {
        switch self {
        case .twoByTwo, .oneByTwo, .threeByTwo:
            return 2
        case .twoByOne, .oneByOne:
            return 1
        }
    }
}
