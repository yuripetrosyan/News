//
//  ContentView.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var apiManager = NewsAPIManager()
    @State private var selectedURL: IdentifiableURL?  // To hold the tapped article URL
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                
                VStack {
                    //List of News Cell
                    List {
                        Section(header: SectionHeader(title: "Today's top stories")) {
                            ForEach(apiManager.articles) { article in
                                Button(action: { selectedURL = IdentifiableURL(url: article.url)}) {
                                    NewsCell(newsImage: article.urlToImage, newsTitle: article.title)
                                        .frame(height: 40)
                                }
                            }
                        }
                        
//                        Section(header: SectionHeader(title: "Today's tech stories")){
//                            ForEach(apiManager.articles) { article in
//                                Button(action: { selectedURL = IdentifiableURL(url: article.url)}) {
//                                    NewsCell(newsImage: article.urlToImage, newsTitle: article.title)
//                                        .frame(height: 40)
//                                }
//                            }
//                            
//                        }
                        
                        
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
                //Safari view with the selectedURL
                .sheet(item: $selectedURL) { identifiableURL in
                    SafariView(url: identifiableURL.url)
                }
            }
            .onAppear{
                apiManager.fetchTopHeadlines()
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





