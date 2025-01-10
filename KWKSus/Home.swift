//
//  Home.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 12/30/24.
//

import SwiftUI



struct Home: View {
    
    @State private var selectedPreference: String = UserDefaults.standard.string(forKey: "preferences") ?? "water"
    
    var body: some View {
        
        
            ZStack{
                Color(red:211/255, green: 220/255 , blue: 204/255)
                    .ignoresSafeArea(.all)
                
                VStack{
                    Text("Home.")
                        .font(.custom("PTSerif-Bold", size: 57))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                    Text("Read the news, plant some new greens.")
                        .font(.custom("Martel-Regular", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    Divider()
                        .frame(width: 350, height:3,alignment: .center)
                        .overlay(Color(red: 78/255, green: 112/255, blue: 96/255))
                        .padding(.trailing, 24)
                        .padding(.bottom, 10)
                        
                    Text("What are you interested in?")
                        .font(.custom("Martel-Bold", size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    // buttons
                    
                    HStack(spacing: 12) {
                        Button(action: {
                            togglePreferences(pref: "water")
                        }, label: {
                            HStack{
                                Image(systemName: "drop")
                                Text("water")
                                    .font(.custom("Martel-Regular", size: 18))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundStyle(.white)
                                
                        }).background(Rectangle().fill(Color(red: 98/255, green: 174/255, blue: 204/255))
                            .cornerRadius(50)
                        )
                        
                        Button(action: {
                            togglePreferences(pref: "power")
                        }, label: {
                            HStack{
                                Image(systemName: "drop")
                                Text("power")
                                    .font(.custom("Martel-Regular", size: 18))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundStyle(.white)
                                
                        }).background(Rectangle().fill(Color(red: 277/255, green: 177/255, blue: 61/255))
                            .cornerRadius(50)
                        )
                        
                        Button(action: {
                            togglePreferences(pref: "carbon")
                        }, label: {
                            HStack{
                                Image(systemName: "drop")
                                Text("carbon")
                                    .font(.custom("Martel-Regular", size: 18))
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .foregroundStyle(.white)
                                
                        }).background(Rectangle().fill(Color(red: 122/255, green: 187/255, blue: 88/255))
                            .cornerRadius(50)
                        )
                    } // end hstack
                    .frame(width: .infinity, alignment: .center)
                    .padding(.trailing, 24)
                    .padding(.bottom, 10)
                        
                    
                    // todo list
                    
                    Text("Weekly To Do List")
                        .font(.custom("Martel-Bold", size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
                    
                    // best articles
                    
                    Text("Learn")
                        .font(.custom("Martel-Bold", size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    Text("Some of the best articles to get started. Find more environmental AI news in the discover section.")
                        .font(.custom("Martel-Regular", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                        .padding(.bottom, 10)
                        .padding(.trailing, 24)
                    
                    
                        
                } // end vstack
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.horizontal, 48)
                .padding(.leading, 24)
                
                
                
                
            } // end zstack
        
        
    } // end body
    private func togglePreferences(pref: String) {
        let defaults = UserDefaults.standard
        defaults.set(pref, forKey: "preferences")
        selectedPreference = defaults.string(forKey: "preferences") ?? "water"
    }
} // home ending






#Preview {
        Home()
}
