//
//  NavBar.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 12/30/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case book
    case bag
    case person
}

struct NavBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
       
        
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1)
                        .font(.system(size:22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                            
                        }
                        .foregroundColor(Color(red: 100/255, green: 127/255, blue: 96/255))
                    Spacer()
                
                    
                }
                
            }
            .frame(width:nil, height:60)
            .background(Color(red: 252/255, green: 251/255, blue: 247/255))
            .cornerRadius(100)
        }

    }
}

#Preview {
    NavBar(selectedTab: .constant(.house))
}
