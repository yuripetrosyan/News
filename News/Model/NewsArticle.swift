//
//  NewsArticle.swift
//  News
//
//  Created by Yuri Petrosyan on 06/11/2024.
//

import Foundation


struct NewsArticle: Identifiable, Codable{
    var id: UUID { UUID() }
    let title: String
  //  let image: String
    let url: URL
    let description: String?
    let urlToImage: URL?
    let publishedAt: String?
    
    //expand later with desctiption, date and URL
    
 }




struct NewsResponse: Codable {
    let articles: [NewsArticle]
}

// Wrapper for URL to make it Identifiable
struct IdentifiableURL: Identifiable {
    let id = UUID()
    let url: URL
}
