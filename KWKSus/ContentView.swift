//
//  Home.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 12/30/24.
//

import SwiftUI



struct ContentView: View {
    @State var selectedTab: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    
    var body: some View {
        
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    Home(selectedTab: $selectedTab)
                        .tag(Tab.house)
                        .transition(.slide)
                    Discover()
                        .tag(Tab.book)
                        .transition(.slide)
                    Shop()
                        .tag(Tab.bag)
                        .transition(.slide)
                    Profile()
                        .tag(Tab.person)
                        .transition(.slide)
                }
            }

            
            VStack {
                Spacer()
                NavBar(selectedTab: $selectedTab)
                    .padding(30)
            }
            
        }

        .ignoresSafeArea(.all)

        
    }
}

#Preview {
        ContentView()
}
