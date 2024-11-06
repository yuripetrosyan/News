//
//  NewsAPIManager.swift
//  News
//
//  Created by Yuri Petrosyan on 06/11/2024.
//

import Foundation


class NewsAPIManager: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var categoryArticles: [NewsArticle] = []
    
    let apiKey = "23e9eaacab0e47e898e64ab8cb154151"
    let baseURL = "https://newsapi.org/v2/top-headlines"

 
    func fetchTopHeadlines(for country: String){
        guard let url = URL( string: "\(baseURL)?country=\(country)&apiKey=\(apiKey)") else {
            return  }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.articles = decodedResponse.articles
                    
                }
            }catch {
                print("Failed to decode JSON: \(error)")
            }
        }.resume()
    }
    
    
    func fetchNewsByCategory(for category: String){
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.categoryArticles = decodedResponse.articles
                }
            }catch {
                print("Error decoding data: \(error)")
            }
        }.resume()
    }
}
