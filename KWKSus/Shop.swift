//
//  Shop.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 1/25/25.
//

import SwiftUI

struct Shop: View {
    @AppStorage("userPoints") var userPoints: Int = 0
    @AppStorage("flowersBought") var flowersBought: Int = 0

    @State private var rewardLs: [Reward] = Rewards.rewardsList
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        ZStack() {
            Color(red:211/255, green: 220/255 , blue: 204/255)
                .ignoresSafeArea(.all)
            ScrollView {
                
                VStack {
                    Text("Shop")
                        .font(.custom("PTSerif-Bold", size: 57))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                        .padding(.bottom, 10)
                    VStack {
                        Text("Leaf Coins: \(userPoints)" )
                            .font(.custom("Martel-Bold", size: 22))
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("If you need more leaf coins, read more articles and complete challenges!" )
                            .font(.custom("Martel-Regular", size: 17))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                    }
                    .padding()
                    .background(Rectangle().foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255)).cornerRadius(20))
                    
                    Divider()
                        .frame(width: 350, height:3,alignment: .center)
                        .overlay(Color(red: 78/255, green: 112/255, blue: 96/255))
                        .padding(.vertical, 20)
                    VStack {
                        ForEach(rewardLs) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.custom("Martel-Regular", size: 18))
                                        .foregroundColor(.white)
                                    Text("Cost: \(item.points)")
                                        .font(.custom("Martel-Regular", size: 16))
                                        .foregroundColor(.white)
                                }
                                Spacer()
                                
                                Button(action: {
                                    if userPoints < item.points {
                                        showAlert.toggle()
                                        userPoints = 200
                                    }
                                    else {
                                        flowersBought += 1
                                        userPoints -= item.points
                                    }
                                }, label: {
                                    HStack{
                                        Text("Buy")
                                            .font(.custom("Martel-Regular", size: 15))
                                            .foregroundColor(.black)
                                        
                                    }
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background(Rectangle().fill(Color(red: 255/255, green: 254/255, blue: 244/255))
                                    .cornerRadius(10))
                                    
                                })
                                
                            }
                            .padding(.horizontal, 30)
                            .background(Rectangle().frame(width:350, height: 130).foregroundStyle(Color(red: 126/255, green: 173/255, blue: 119/255)).cornerRadius(20))
                            .padding(.vertical, 30)
                            
                            
                        }
                    } // end vstack
                    
                }
                .padding(.horizontal, 24)
            }
            .padding(.bottom, 70)
            .padding(.top, 10)
            
            if showAlert {
                PopupAlert(showAlert: $showAlert)
            }
            
            
        }
        
        

    } // end body
}// end shopview

struct PopupAlert: View {
    @Binding var showAlert: Bool

    var body: some View {
        ZStack {
            

            VStack(spacing: 20) {
                Text("Error:")
                    .font(.title)
                    .bold()

                Text("Not enough coins")
                    .multilineTextAlignment(.center)

                
                    Button(action: {
                        showAlert = false
                    }) {
                        Text("OK")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Rectangle().foregroundStyle(Color(red: 126/255, green: 173/255, blue: 119/255)))
                            .cornerRadius(10)
                    }
                
            }
            .padding(30)
            .background(Rectangle().foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255)).cornerRadius(20))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 78/255, green: 112/255, blue: 96/255), lineWidth: 2)
            )
            .padding()
            
        }
    }
}


#Preview {
    Shop()
}


////struct ShopView: View {
//
//@AppStorage("userPoints") var userPoints: Int = 0
//
//var body: some View {
//    VStack {
//        Text("Shop")
//            .font(.custom("Martel-Bold", size: 30))
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
//        Text("Leaf Coins: \(userPoints)" )
//            .font(.custom("Martel-Bold", size: 20))
//            .frame(maxWidth: .infinity, alignment: .center)
//        
//        
//    }
//}
//
//}
