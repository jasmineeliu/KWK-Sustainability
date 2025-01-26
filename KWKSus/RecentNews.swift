import Foundation

/* Creating a holder for news articles found */
struct NewsArticle: Codable, Identifiable {
    let id = UUID()
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let author: String?
    let publishedAt: String?
}

struct NewsAPIResponse: Codable {
    let articles: [NewsArticle]
}

/* Class for calling the NewsAPI */
class NewsAPIService {
    let key = Secret.APIKEY
    static let shared = NewsAPIService()

    
    func fetchArticles(completion: @escaping ([NewsArticle]?) -> Void) {
//        let urlString = "https://newsapi.org/v2/everything?q=(ai AND environment) AND impact AND climate AND (water OR pollution OR energy OR agriculture OR air quality OR carbon footprint OR sustainability) &language=en&pageSize=20&sortBy=relevancy&apiKey=\(key)"
        
        let urlString = "https://newsapi.org/v2/everything?q=(AI AND environment AND sustainability) OR (AI AND carbon footprint) OR (AI AND pollution) OR (AI AND water) OR (AI AND agriculture) OR (AI AND air quality) OR (AI AND energy) OR (AI AND climate) OR (AI AND biodiversity) OR (AI AND Climate Change) &sortBy=relevancy&language=en&pageSize=100&apiKey=\(key)"
        
        guard let url = URL(string: urlString) else {
            print("Error creating URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          
            if let error = error {
                print("Error fetching articles: \(error)")
                completion(nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error fetching articles: invalid response")
                completion(nil)
                return
            }
            
            
            guard let data = data else {
                print("Error fetching articles: no data")
                completion(nil)
                return
            }
            
            
            
            
            do {
                
                let response = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                let filteredArticles = response.articles.filter { article in
                                (article.title?.contains("AI") ?? false)
                    && ((article.description?.contains("sustainability") ?? false) || (article.description?.contains("environment") ?? false) || (article.description?.contains("water") ?? false) || (article.description?.contains("pollution") ?? false) || (article.description?.contains("pollution") ?? false) || (article.description?.contains("carbon footprint") ?? false) || (article.description?.contains("energy") ?? false) || (article.description?.contains("agriculture") ?? false) || (article.description?.contains("air quality") ?? false) || (article.description?.contains("climate") ?? false) || (article.description?.contains("air quality") ?? false) || (article.description?.contains("biodiversity") ?? false))
                            }
                completion(filteredArticles)

                
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
                
            }
            
            
        })
        task.resume()
    }
}


