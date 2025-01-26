//
//  Home.swift
//  KWKSus
//
//  Created by jasmine 🍡 on 12/30/24.
//

import SwiftUI



struct Home: View {
    
    @Binding var selectedTab: Tab
    @State private var selectedArticle: NewsArticle? = nil
    @State private var presentMission: Bool = false
    
    
    
    
    var body: some View {
        
        
            ZStack{
                Color(red:211/255, green: 220/255 , blue: 204/255)
                    .ignoresSafeArea(.all)
                ScrollView {
                    VStack{
                        Text("Home.")
                            .font(.custom("PTSerif-Bold", size: 57))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                        Text("Read the news, plant some new greens.")
                            .font(.custom("Martel-Bold", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 10)
                        
                        Divider()
                            .frame(width: 350, height:3,alignment: .center)
                            .overlay(Color(red: 78/255, green: 112/255, blue: 96/255))
                            .padding(.trailing, 24)
                        //                        .padding(.bott)
                        
                        VStack {
                            Text("What is newgreens?  Read more about our mission.")
                                .font(.custom("Martel-Regular", size: 18))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 5)
                            
                            Button (action: {
                                presentMission = true
                            }, label: {
                                HStack {
                                    
                                    Text("Explore our Why")
                                        .font(.custom("Martel-Bold", size: 18))
                                        .padding(.trailing, 140)
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.white)
                                        .bold()
                                    
                                }
                                .foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255))
                                .background(Rectangle().frame(width: 370, height: 70).foregroundStyle(Color(red: 78/255, green: 112/255, blue: 96/255)).cornerRadius(20))
                                .padding(.trailing, 24)
                                .padding(.vertical, 20)
                                
                                
                            })
                            
                        }
                        .padding(.bottom, 20)
                        
                        // best articles
                        VStack {
                            Text("Learn")
                                .font(.custom("Martel-Bold", size: 19))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 10)
                            
                            Text("Explore some of the best articles to get started. Find mixed perspectives on how AI impacts the environment.")
                                .font(.custom("Martel-Regular", size: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                                .padding(.bottom, 10)
                                .padding(.trailing, 24)
                            
                            shownArticles // show articles
                        }
                        .padding(.bottom, 20)
                        
                        Text("Still want more?")
                            .font(.custom("Martel-Bold", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                            .padding(.vertical, 10)
                            .padding(.trailing, 24)
                        
                        Button (action: {
                            selectedTab = .book
                        }, label: {
                            HStack {
                                
                                Text("View our discover page")
                                    .font(.custom("Martel-Bold", size: 18))
                                    .padding(.trailing, 90)
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                                    .bold()
                                
                            }
                            .foregroundStyle(Color(red: 255/255, green: 254/255, blue: 244/255))
                            .background(Rectangle().frame(width: 370, height: 70).foregroundStyle(Color(red: 135/255, green: 165/255, blue: 116/255)).cornerRadius(20))
                            .padding(.trailing, 24)
                            .padding(.vertical, 20)
                            
                            
                        })
                        
                    } // end vstack
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.leading, 24)
                    .fullScreenCover(isPresented: $presentMission, content: {
                        missionView()
                    })
                    
                }
                .padding(.bottom, 70)
                .padding(.top, 10)
                

                
                
                
            } // end zstack
        
        
    } // end body
    
    
    var shownArticles: some View {
       
            HStack {
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack{
                        ForEach(HomeArticles.articles, id: \.id) { article in

                                Button (action: {
                                    selectedArticle = article
                                }, label: {
                                        
                                                VStack {
                                                    AsyncImage(url: URL(string: article.urlToImage ?? "")) {
                                                        image in
                                                        image.resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 170, height: 140)
                                                            .clipShape(.rect(cornerRadius: 10))
                                                            .padding(.horizontal, 30)
                                                            .padding(.vertical, 6.0)
                                                        
                                                    } placeholder: {
                                                        Image("laptop-nature-concept")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .frame(width: 170, height: 140)
                                                            .clipShape(.rect(cornerRadius: 10))
                                                            .padding(.horizontal, 10)
                                                            .padding(.vertical, 6.0)
                                                    }
                                                    
                                                    
                                                    Text(article.title ?? "No Title")
                                                        .font(.custom("Martel-Bold", size: 18))
                                                        .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                                                        .frame(width: 165, alignment: .leading)
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundStyle(Color.black)
                                                }
                                                .padding(.horizontal, 30)
                                                .padding(.vertical, 15.0)
                                                
                                            
                                            .background(
                                                Rectangle().frame(width: 200, height: 270).foregroundColor(Color(red: 255/255, green: 254/255, blue: 244/255)).cornerRadius(30)
                                            )
                                            .frame(width: 200, height: 270)
                                            .padding(.trailing, 10)
                                            // finish designing
                                        })
                                .sheet(item: $selectedArticle) {article in
                                    ArticleDetails(article: article)
                                        .presentationDetents([.height(625)])
                                }
                                
                                
                                    }
                                 // end of what happens if article is valid
                                        
                        }
                    }

            } // end Hstack
                
        
    } //end homeArticles
    
    
    
    struct ArticleDetails: View {
        let article: NewsArticle
        @Environment(\.dismiss) var dismissScreen
        @Environment(\.openURL) var openURL
        
        
        
        var body: some View {
            let authorText = article.author ?? "Author Unknown"
            let dateText = article.publishedAt ?? "Date Published Unknown"
            
            ScrollView {
                ZStack(alignment: .top) {
                    Color(red: 252/255, green: 251/255, blue: 247/255)
                        .ignoresSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Button(action:{
                                dismissScreen()
                            }, label: {
                                Image(systemName: "xmark")
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 22)
                                    .font(.largeTitle)
                                    .foregroundColor(Color(red: 100/255, green: 127/255, blue: 96/255))
                            })
                            .frame(maxWidth: .infinity, alignment:.leading)
                            
                            Button( action: {
                                if let url = URL(string: article.url ?? "") {
                                    let curRead = UserDefaults.standard.integer(forKey: "articlesRead") + 1
                                    UserDefaults.standard.set(curRead, forKey: "articlesRead")
                                    openURL(url)
                                }
                                else {
                                    print("Invalid URL")
                                }
                            }, label: {
                                Image(systemName: "arrowshape.turn.up.forward")
                                    .padding(.horizontal, 40)
                                    .padding(.vertical, 22)
                                    .font(.largeTitle)
                                    .foregroundColor(Color(red: 100/255, green: 127/255, blue: 96/255))
                            })
                            .frame(maxWidth: .infinity, alignment:.trailing)
                            
                        } // end hstack
                        
                        VStack() {
                            
                            
                            
                            Text(article.title ?? "Title Not Available")
                                .font(.custom("PTSerif-Bold", size: 25))
                                .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                                .frame(maxWidth: .infinity, alignment:.leading)
                                .padding(.bottom, 2)
                            HStack {
                                Text("\(authorText) • \(dateText)")
                                    .font(.custom("Martel-Bold", size: 15))
                                    .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                                    .frame(maxWidth: .infinity, alignment:.leading)
                                
                            }
                            
                            .foregroundColor(Color.gray)
                            
                            AsyncImage(url: URL(string: article.urlToImage ?? "")) {
                                image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 370, height: 250)
                                    .clipShape(.rect(cornerRadius: 10))
                                    .clipped()
                            } placeholder: {
                                Image("laptop-nature-concept")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 370, height: 250)
                                    .clipShape(.rect(cornerRadius: 10))
                            }
                            
                            
                            
                            
                            
                            
                            Text(article.description ?? "Description Not Found")
                            
                                .font(.custom("Martel-Regular", size: 16))
                                .environment(\._lineHeightMultiple, 0.9) .minimumScaleFactor(0.1)
                                .padding(.top, 5)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.horizontal, 40)
                        .padding(.bottom, 20)
                        
                        Button( action: {
                            if let url = URL(string: article.url ?? "") {
                                let curRead = UserDefaults.standard.integer(forKey: "articlesRead") + 1
                                UserDefaults.standard.set(curRead, forKey: "articlesRead")
                                openURL(url)
                            }
                            else {
                                print("Invalid URL")
                            }
                        }, label: {
                            Text("Read More")
                                .foregroundStyle(Color(red: 252/255, green: 251/255, blue: 247/255))
                                .font(.custom("Martel-Bold", size: 15))
                                .background(
                                    Rectangle().frame(width: 150, height: 50).foregroundColor(Color(red: 100/255, green: 127/255, blue: 96/255)).cornerRadius(50)
                                    
                                )
                        })
                        
                        
                    } // end big vstack
                    .padding(.bottom, 40)
                    
                } // end of scrollview
                // end big zstack
            }
            .ignoresSafeArea(edges: .all)
        }
    }
       
    
    struct missionView: View {
        @Environment(\.dismiss) var dismissScreen

        var body: some View {
            
            ZStack{
                Color(red: 255/255, green: 254/255, blue: 244/255)
                ScrollView {
                    VStack() {
                        
                        Button(action:{
                            dismissScreen()
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .foregroundColor(Color(red: 100/255, green: 127/255, blue: 96/255))
                        })
                        .frame(maxWidth: .infinity, alignment:.leading )
                        .padding(.bottom, 20)
                        
                        
                        Text("Our Mission")
                            .font(.custom("PTSerif-Bold", size: 57))
                            .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                            .environment(\._lineHeightMultiple, 0.9)
                        
                        Text("What is newgreens? At newgreens, we want to motivate people to begin reading the news to learn more about the environment. Specifically, we're focused at the intersection of AI and the environment. AI is here to stay, but while many know about ChatGPT, not many know how it specifically impacts the environment. We want to change that. We're building a platform so that readers can learn about how AI is impacting the environment and do something about it. And, we provide incentives! For every article read, you get five leaf coins-- our currency here at newgreens. We also have weekly to-do lists with environmentally friendly tasks you can complete for more leafcoins. Right now, you can use leaf coins to build your virtual garden. Fill it with flowers and show it off to friends! Further, in the future, we'd love to partner with local environmental organizations to offer discounts on eco-friendly products, newsletters, and more. ")
                            .font(.custom("Martel-Regular", size: 18))
                        //                        .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 5)
                        
                    } // end vstack
                    .padding(.horizontal, 30)
                }
                .padding(.bottom, 70)
                .padding(.top, 70)
            } // end ZStack
            .ignoresSafeArea(.all)
            
            
            
        }
        
    } // end mission View
    
    } // home ending






//#Preview {
//        Home(selectedTab: <#T##Binding<Tab>#>())
//}
