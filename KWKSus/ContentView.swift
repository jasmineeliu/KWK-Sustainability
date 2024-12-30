import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var articles: [NewsArticle] = []

    
    var body: some View {
        ZStack {
            Color(red:211/255, green: 220/255 , blue: 204/255)
                .ignoresSafeArea(.all)
            VStack {
                VStack {
                    Text("Discover.")
                        .font(.custom("PTSerif-Bold", size: 57))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color(red: 78/255, green: 112/225, blue: 96/225))
                    Text("Discover the latest articles on AI in the environment")
                        .font(.custom("Martel-Regular", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    
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
        
        
        
    } // end body view
    
// relevant articles

    
    var relevantArticles: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators:false) {
                HStack{
                    ForEach(articles) { article in
                        if (article.title != "[Removed]" && article.description != "[Removed]" && article.title != "" && article.title != nil) {
                            
                            VStack{
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
                                }
                                .padding(.horizontal, 30)
                                .padding(.vertical, 15.0)
                                
                            }
                            
                            .background(
                                
                                Rectangle().frame(width: 200, height: 270).foregroundColor(Color(red: 100/255, green: 127/225, blue: 96/225)).cornerRadius(10)
                            )
                            .frame(width: 200, height: 270)
                            .padding(.trailing, 10)
                            // finish designing
                            
                            
                        }
                    }
                }
            }
            

                
        }.onAppear {
            NewsAPIService.shared.fetchArticles {
                fetchedArt in if let fetchedArticles = fetchedArt{
                    DispatchQueue.main.async {
                        self.articles = fetchedArticles
                    }
                }
            }
        }
    } //end relevantArticles
    
} // end contentview



#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
