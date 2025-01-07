import SwiftUI
import SwiftData

struct Discover: View {
    @State private var articles: [NewsArticle] = []
    @State private var selectedArticle: NewsArticle? = nil

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red:211/255, green: 220/255 , blue: 204/255)
                    .ignoresSafeArea(.all)
                VStack {
                    VStack {
                        Text("Discover.")
                            .font(.custom("PTSerif-Bold", size: 57))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color(red: 78/255, green: 112/255, blue: 96/255))
                        Text("Discover the latest articles on AI in the environment")
                            .font(.custom("Martel-Regular", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom, 10)
                        
                        Text("Latest Articles")
                            .font(.custom("Martel-ExtraBold", size: 22))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //relevantArticles
                        
                        
                        
                        
                    } // first block of AI in sustainability articles
                    .padding(.leading, 24)
                    .padding(.bottom, 10)
                    
                    
                    VStack {
                        Text("Recommended for you")
                            .font(.custom("Martel-ExtraBold", size: 22))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.leading, 24)
                    
                } //end VStack
                .frame(maxHeight: .infinity, alignment: .top)
            } //end ZStack
            
        }
        
    } // end body view
    
// relevant articles

    
    var relevantArticles: some View {
       
            HStack {
                ScrollView(.horizontal, showsIndicators:false) {
                    HStack{
                        ForEach(articles, id: \.id) { article in
                            
                            if (article.title != "[Removed]" && article.description != "[Removed]" && article.title != "" && article.title != nil) {

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
                                                Rectangle().frame(width: 200, height: 270).foregroundColor(Color(red: 127/255, green: 165/255, blue: 116/255)).cornerRadius(30)
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
                                } // end of what happens if article is valid
                                        
                        }
                    }

            } // end Hstack
                
        .onAppear {
            NewsAPIService.shared.fetchArticles {
                fetchedArt in if let fetchedArticles = fetchedArt{
                    DispatchQueue.main.async {
                        self.articles = fetchedArticles
                    }
                }
            }
        }
    } //end relevantArticles
    
    
    
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
                            
                        }
                        
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
                        .padding(.bottom, 40)
                        
                    } // end big vstack
                    
                }
                // end big zstack
            }
            .ignoresSafeArea(.all)
            
        }
    }
    
    
    
    
    
    
    
} // end contentview



#Preview {
    Discover()
}
