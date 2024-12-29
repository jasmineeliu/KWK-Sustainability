import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var articles: [NewsArticle] = []

    
    var body: some View {
        ZStack {
            Color(red:211/255, green: 220/255 , blue: 204/255)
                .ignoresSafeArea(.all)
            VStack {
                Text("Discover.")
                Text("Discover the latest articles on AI in the environment")
                
                relevantArticles
                
            } //end VStack
        } //end ZStack
        
        
        
    } // end body view
    
    var relevantArticles: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators:false) {
                HStack{
                    ForEach(articles) { article in
                        if (article.title != "[Removed]" && article.description != "[Removed]") {
                    
                            VStack{
                                    Text(article.title ?? "No Title")
                                    
                                
                                .padding()
                            }
                            .background(
                                
                                Rectangle().frame(width: 200, height: 250).foregroundColor(Color(red: 127/255, green: 165/225, blue: 116/225)).cornerRadius(18)
                            )
                            .frame(width: 200, height: 250)
                            .padding(5)

                            
                        }
                    }
                }
                .padding(.leading, 8.0)
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
