import Foundation

/* Creating a holder for news articles found */
struct NewsArticle: Codable, Identifiable {
    let id = UUID()
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
}

struct NewsAPIResponse: Codable {
    let articles: [NewsArticle]
}

/* Class for calling the NewsAPI */
class NewsAPIService {
    let key = Secret.APIKEY
    static let shared = NewsAPIService()

    
    func fetchArticles(completion: @escaping ([NewsArticle]?) -> Void) {
        let urlString = "https://newsapi.org/v2/everything?q=(ai AND environment) AND (water OR climate OR pollution OR energy OR modeling OR agriculture OR air quality OR carbon footprint OR sustainability) &language=en&pageSize=20&sortBy=relevancy&apiKey=\(key)"
        
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
                completion(response.articles)
                
            } catch {
                print("Error decoding JSON: \(error)")
                completion(nil)
                
            }
            
            
        })
        task.resume()
    }
}
