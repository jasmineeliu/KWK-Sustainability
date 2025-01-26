//
//  Profile.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 12/30/24.
//

import SwiftUI

struct Profile: View {
    @AppStorage("selectedPreference") var selectedPreference: String = "water"
    @AppStorage("name") var name: String = "Name Unknown"
    @AppStorage("articlesRead") var articlesRead: Int = 0
    @AppStorage("userPoints") var userPoints: Int = 0
    @AppStorage("flowersBought") var flowersBought: Int = 0
    @State var newName: String = ""
    @State var showNameEditor: Bool = false
    
    @State private var weeklyTasks: [ToDo] = []
    @State private var specificTask: [ToDo] = []
    
    @State private var flowerOptions: [String] = ["tulip", "rose", "daisy"]



    private func randomPosition(index: Int) -> CGPoint {
        let fixedY: CGFloat = 80 // Adjust to set the vertical level of flowers
        let spacing: CGFloat = 100 // Space between each flower
        let startX: CGFloat = 10 // Starting x-position
        let offsetX = CGFloat(index) * spacing
        return CGPoint(x: startX + offsetX, y: fixedY)
        }
    
    func assignWeeklyTasks() -> [ToDo] {
        let lastTaskDate = UserDefaults.standard.object(forKey: "lastTaskDate") as? Date ?? Date.distantPast
            let currentDate = Date()
            
            if Calendar.current.isDate(lastTaskDate, equalTo: currentDate, toGranularity: .weekOfYear) {
                // Same week: Load previously assigned tasks
                if let savedData = UserDefaults.standard.data(forKey: "weeklyTasks"),
                   let savedTasks = try? JSONDecoder().decode([ToDo].self, from: savedData) {
                    return savedTasks
                }
            } else {
                // New week: Generate and save new tasks
                let newTasks = ToDoList.weeklyTasks.shuffled().prefix(3).map { $0 }
                if let encodedData = try? JSONEncoder().encode(newTasks) {
                    UserDefaults.standard.set(encodedData, forKey: "weeklyTasks")
                }
                UserDefaults.standard.set(currentDate, forKey: "lastTaskDate")
                return newTasks
            }
            
            return [] // safety
        
    }
    
    func assignSpecificTask() -> [ToDo] {
        if selectedPreference == "water" {
            return ToDoList.waterTasks.shuffled().prefix(2).map { $0 }
        }
        else if selectedPreference == "climate" {
            return ToDoList.climateTasks.shuffled().prefix(2).map { $0 }
        }
        else {
            return ToDoList.powerTasks.shuffled().prefix(2).map { $0 }
        }
    }

    private func loadTasks(from key: String) -> [ToDo]? {
            if let data = UserDefaults.standard.data(forKey: key),
               let tasks = try? JSONDecoder().decode([ToDo].self, from: data) {
                return tasks
            }
            return nil
        }

//    @State var selectedPreference: String = UserDefaults.standard.string(forKey: "preferences") ?? "water"
    
    private func togglePreferences(pref: String) {
        let defaults = UserDefaults.standard
        defaults.set(pref, forKey: "preferences")
        selectedPreference = defaults.string(forKey: "preferences") ?? "water"
    }

    
    var body: some View {
        ZStack {
            Color(red:211/255, green: 220/255 , blue: 204/255)
                .ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    Text("Profile.")
                        .font(.custom("PTSerif-Bold", size: 57))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))

                    
                    // profile sectoin
                    ZStack {
                        Color(red: 78/255, green: 112/255, blue: 96/255)

                        VStack(spacing: 10) {
                            Image("treepfp")
                                .resizable()
                                .frame(width: 180, height: 180)
                                .clipShape(Circle())
                                .padding(20)
                            
                            HStack {
                                Text(name)
                                    .font(.custom("Martel-Bold", size: 25))
                                    .foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255))
                                    .padding(.trailing, 5)
                                Button(action: {
                                    showNameEditor.toggle()
                                    flowersBought += 1
                                }, label: {
                                    Image(systemName: "pencil.line")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255))
                                })
                                
                            }
                            
                            HStack {
                                Text("Articles Read: \(articlesRead)" )
                                    .font(.custom("Martel-Bold", size: 18))
                                    .foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255))
                                    .padding(.trailing, 5)
                            }
                            
                        }.padding(40)
                            .padding(.bottom, 20)
                        
                        
                        // let edit name
                        if showNameEditor {
                            ZStack{
                                Color(red: 255/255, green: 254/255, blue: 244/255)
                                
                                VStack() {
                                    Button(action:{
                                        showNameEditor.toggle()
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .font(.largeTitle)
                                            .foregroundColor(Color(red: 100/255, green: 127/255, blue: 96/255))
                                    })
                                    .frame(maxWidth: .infinity, alignment:.leading )
                                    .padding(.bottom, 35)
                                    VStack() {
                                        Text("Choose a new username")
                                            .font(.custom("Martel-Bold", size: 22))
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .foregroundStyle(Color(red: 78/255, green: 112/255, blue: 96/255))
                                            .padding(.trailing, 5)
                                        TextField("name", text: $newName)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color(red: 78/255, green: 112/255, blue: 96/255), lineWidth: 2)
                                            )
                                        Button(action:{
                                            name = newName
                                            showNameEditor.toggle()
                                            
                                        }, label: {
                                            Text("Save")
                                                .font(.custom("Martel-Regular", size: 17))
                                                .foregroundStyle(Color.white)
                                            
                                        })
                                        .padding(.horizontal, 20)
                                        .padding(.vertical, 5)
                                        .background(Rectangle().fill(Color(red: 78/255, green: 112/255, blue: 96/255))
                                            .cornerRadius(50))
                                        .padding(.top, 20)

                                        
                                    }.padding(.bottom, 50)
                                    
                                }.padding(.horizontal, 30)
                            } // end zstack
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color(red: 78/255, green: 112/255, blue: 96/255), lineWidth: 5)
                            )
                            
                        } // end show editor
                        
                    }
                    .cornerRadius(30)
                    .padding(.horizontal, 10)
                    .padding(.trailing, 24)
                    .padding(.bottom, 20)
                    
                    // start of interests
                    Text("What are you interested in?")
                        .font(.custom("Martel-Bold", size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                        .padding(.bottom, 10)
                    
                    // buttons
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            selectedPreference = "water"
                        }, label: {
                            HStack{
                                Image(systemName: selectedPreference == "water" ? "drop.fill": "drop")
                                Text("water")
                                    .font(.custom("Martel-Regular", size: 17))
                                
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundStyle(selectedPreference == "water" ? .black : .white)
                            
                        }).background(Rectangle().fill(Color(red: 98/255, green: 174/255, blue: 204/255))
                            .cornerRadius(50)
                        )
                        
                        Button(action: {
                            selectedPreference = "power"
                        }, label: {
                            HStack{
                                Image(systemName: selectedPreference == "power" ? "sun.max.fill" : "sun.max")
                                Text("power")
                                    .font(.custom("Martel-Regular", size: 17))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundStyle(selectedPreference == "power" ? .black : .white)
                            
                        }).background(Rectangle().fill(Color(red: 277/255, green: 177/255, blue: 61/255))
                            .cornerRadius(50)
                        )
                        
                        Button(action: {
                            selectedPreference = "climate"
                        }, label: {
                            HStack{
                                Image(systemName: selectedPreference == "climate" ? "leaf.fill" : "leaf")
                                Text("climate")
                                    .font(.custom("Martel-Regular", size: 15))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundStyle(selectedPreference == "climate" ? .black : .white)
                            
                        }).background(Rectangle().fill(Color(red: 122/255, green: 187/255, blue: 88/255))
                            .cornerRadius(50)
                        )
                    } // end hstack
                    
                    .padding(.trailing, 24)
                    .padding(.bottom, 10)
                    
                    
                    // todo list
                    
                    Text("Weekly To Do List")
                        .font(.custom("Martel-Bold", size: 30))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                    Text("Don't let AI be the only environmentally friendly one! ")
                        .font(.custom("Martel-Regular", size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    

                    WeeklyToDoList(weeklyTasks: $weeklyTasks, specificTask: $specificTask)
                            .padding(.trailing, 24)
                            .onAppear {
                                weeklyTasks = loadTasks(from: "weeklyTasks") ?? assignWeeklyTasks()
                                specificTask = loadTasks(from: "specificTasks") ?? assignSpecificTask()
                            }
                            .onChange(of: selectedPreference) { newValue in
                                                    specificTask = assignSpecificTask()
                                                }
                    
                        .padding(.trailing, 24)

                    Text("Your Garden")
                        .font(.custom("Martel-Bold", size: 30))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                    Text("Stay for a little and enjoy the view :) ")
                        .font(.custom("Martel-Regular", size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    ZStack(alignment: .leading) {
                        
                        Image("field")
                            .resizable()
                            .scaledToFit( )
                            .padding(.trailing, 24)
                        
                        ForEach(0..<flowersBought, id: \.self) {index in
                            Image(flowerOptions[index])
                                .resizable()
                                .position(randomPosition(index: index+1))
                                .frame(width: 80, height: 80)
                            
//                            Text("\(index)")
//                                .position(randomPosition())
                        }
                        
                        
                    }
                    
                } // vstack
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.leading, 24)
            } // end scroll
            .padding(.bottom, 70)
            .padding(.top, 10)
        } // zstack
    } // finish body

    
} // finish profile


struct WeeklyToDoList: View {
    @Binding var weeklyTasks: [ToDo]
    @Binding var specificTask: [ToDo]

    private func saveTasks(_ tasks: [ToDo], to key: String) {
            if let encoded = try? JSONEncoder().encode(tasks) {
                UserDefaults.standard.set(encoded, forKey: key)
            }
        }
    
    
    var body: some View {
        VStack {
                ForEach(weeklyTasks.indices, id: \.self) { index in
                    HStack(alignment: .center) {
                        Text("\(weeklyTasks[index].title) ( \(weeklyTasks[index].points))")
                            .font(.custom("Martel-Regular", size: 17))
                        
                        Spacer()
                        Button(action: {
                            weeklyTasks[index].isCompleted.toggle()
                            
                            if weeklyTasks[index].isCompleted {
                                let points =  UserDefaults.standard.integer(forKey: "userPoints") + weeklyTasks[index].points
                                UserDefaults.standard.set(points, forKey: "userPoints")
                            }
                            else {
                                var points =  UserDefaults.standard.integer(forKey: "userPoints") - weeklyTasks[index].points
                                if points < 0 {
                                    points = 0
                                }
                                UserDefaults.standard.set(points, forKey: "userPoints")
                            }
                            
                            saveTasks(weeklyTasks, to: "weeklyTasks")
                            
                        }, label: {
                            Image(systemName: weeklyTasks[index].isCompleted ? "checkmark.circle.fill" : "circle")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                                .foregroundStyle(Color(red: 78/255, green: 112/255, blue: 96/255))
                        })
                    }
                    .padding(.top, 5)
                
            }
            
            ForEach(specificTask.indices, id: \.self) { index in
                HStack(alignment: .center) {
                    Text("\(specificTask[index].title) ( \(specificTask[index].points))")
                        .font(.custom("Martel-Regular", size: 17))
                    
                    Spacer()
                    Button(action: {
                        specificTask[index].isCompleted.toggle()
                        
                        if specificTask[index].isCompleted {
                            let points =  UserDefaults.standard.integer(forKey: "userPoints") + specificTask[index].points
                            UserDefaults.standard.set(points, forKey: "userPoints")
                        }
                        else {
                            var points =  UserDefaults.standard.integer(forKey: "userPoints") - specificTask[index].points
                            if points < 0 {
                                points = 0
                            }
                            UserDefaults.standard.set(points, forKey: "userPoints")
                        }
                        
                        saveTasks(specificTask, to: "specificTasks")
                        
                    }, label: {
                        Image(systemName: specificTask[index].isCompleted ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                            .foregroundStyle(Color(red: 78/255, green: 112/255, blue: 96/255))
                    })
                }
                .padding(.top, 5)
            
        }
            
        }
        .padding(30)
        .background(Rectangle().fill(Color(red: 255/255, green: 254/255, blue: 244/255)).cornerRadius(20))
    }
}// fniish weekly todo




#Preview {
    Profile()
}
