//
//  ToDo.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 1/25/25.
//

import Foundation

struct ToDo: Identifiable, Codable {
    let id =  UUID()
    let title: String
    let points: Int
    var isCompleted: Bool
    var type: String
}


struct ToDoList {
    
    static let weeklyTasks: [ToDo] = [
        ToDo(title: "Plant a tree", points: 40, isCompleted: false, type: "normal"),
        ToDo(title: "Invite a friend on the app", points: 100, isCompleted: false, type: "normal"),
        ToDo(title: "Talk to a friend about AI and the environment", points: 30, isCompleted: false, type: "normal"),
        ToDo(title: "Share an article with a friend", points: 30, isCompleted: false, type: "normal"),
        ToDo(title: "Eat vegetarian for the day!", points: 70, isCompleted: false, type: "normal"),
        ToDo(title: "Use a regular search engine, not ChatGPT!", points: 20, isCompleted: false, type: "normal"),
        ToDo(title: "Donate or upcycle old clothes", points: 40, isCompleted: false, type: "normal"),
        ToDo(title: "Walk, bike, public transportation, or carpool today!", points: 30, isCompleted: false, type: "normal"),
        ToDo(title: "Attend a trash clean up event", points: 20, isCompleted: false,type: "normal"),
        ToDo(title: "Compost organic waste", points: 20, isCompleted: false,type: "normal"),

    ]
    
    static let waterTasks: [ToDo] = [
        ToDo(title: "Turn off water while brushing teeth", points: 10, isCompleted: false, type:"water"),
        ToDo(title: "Use a water efficient showerhead!", points: 30, isCompleted: false,  type:"water"),
        ToDo(title: "Use a resuable waterbottle", points: 10, isCompleted: false, type: "water"),
        ToDo(title: "Take a short shower (4-10 minutes)", points: 10, isCompleted: false, type: "water"),
        ToDo(title: "Use a water efficient showerhead!", points: 30, isCompleted: false, type: "water"),
    ]
    
    static let powerTasks: [ToDo] = [
        ToDo(title: "Use energy-efficient light bulbs!", points: 20, isCompleted: false, type: "power"),
        ToDo(title: "Turn off lights when not in use!", points: 10, isCompleted: false, type: "power"),
        ToDo(title: "Use a programmable thermostat!", points: 30, isCompleted: false, type: "power"),
        ToDo(title: "Unplug electronics when not in use!", points: 10, isCompleted: false, type: "power"),
        ToDo(title: "Use a programmable thermostat!", points: 30, isCompleted: false, type: "power"),
        ]
    
    static let climateTasks: [ToDo] = [
        ToDo(title: "Talk to a friend about climate change", points: 20, isCompleted: false, type: "climate"),
        ToDo(title: "Change your energy usage habits to renewable energy", points: 50, isCompleted: false, type: "climate"),
        ToDo(title: "Switch a one use plastic item to a reusable one", points: 20, isCompleted: false, type: "climate"),
        ToDo(title: "Buy less stuff- shop second hand", points: 30, isCompleted: false, type: "climate"),
        ToDo(title: "Support political policies on carbon reduction", points: 50, isCompleted: false, type: "climate"),
        ]

}



