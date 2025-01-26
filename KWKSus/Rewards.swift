//
//  Rewards.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 1/25/25.
//

import Foundation

struct Reward: Identifiable, Codable {
    let id =  UUID()
    let title: String
    let points: Int
}

struct Rewards {
    static let rewardsList: [Reward] = [
        Reward(title: "Buy a random flower for your garden", points: 200),
        Reward(title: "We'll plant a premium flower in your name!", points: 300),
        Reward(title: "We'll plant a tree in your name!", points: 800),
        Reward(title: "Climate Newsletter Subscription (1 month)", points: 1000),
    ]
}
