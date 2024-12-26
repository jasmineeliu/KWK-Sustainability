//
//  Item.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 12/26/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
