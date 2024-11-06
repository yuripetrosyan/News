//
//  ContentView.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    let sampleArticles = [
        NewsArticle(title: "7 new Washington Post articles that will change your life", image: "newspaper"),
        NewsArticle(title: "Apple's latest event highlights new tech trends", image: "applelogo"),
        NewsArticle(title: "Apple's latest products", image: "applelogo")
        
    ]
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                
                VStack {
                     //List of News Cell
                    List {
                        Section(header: SectionHeader(title: "Today's top stories")) {
                            ForEach(sampleArticles) { article in
                                NewsCell(newsImage: article.image, newsTitle: article.title)
                                    .frame(height: 40)
                            }
                        }
                        
                        Section(header: SectionHeader(title: "Today's tech stories")){
                            ForEach(sampleArticles) { article in
                                NewsCell(newsImage: article.image, newsTitle: article.title)
                                    .frame(height: 40)
                            }

                        }
                    }
                    
                    
                }
            }
            //MARK: ToolBar
            .toolbar {
                ToolbarItem(placement: .navigation){
                    //Todays Date formatted to day and month
                    VStack(alignment: .leading){
                    
                        //Date
                        Text(Date().currentMonthAndDay())
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.secondary)
                    }
                    
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }){
                        Image(systemName: "globe")
                            .foregroundStyle(.pink)
                    }
                }
                ToolbarItem{
                    Button(action: {
                        
                    }){
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.pink)

                    }
                }
            }
        }
    }
    

}



//MARK: - Section Header

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(.pink)
            .fontWeight(.semibold)
            .padding(.leading, -10)
    }
}



#Preview {
    ContentView()
}





