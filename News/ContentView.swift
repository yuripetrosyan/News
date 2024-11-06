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
    @State private var selectedCountry: String = "us"//Default country
    @State private var selectedCategory: String = "business"
    @State private var globeIsOn: Bool = false
    
    
    let categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

    
    let countries = [
        ("US", "us"),
        ("NL", "nl"),
        ("ARM", "am"),
        ("UK", "gb"),
        ("CN", "ca"),
        ("AU", "au"),
        ("IND", "in")
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                
                
                VStack {
                    //List of News Cell
                    List {
                        //Top News
                        Section(header: SectionHeader(title: "Today's top stories in \(selectedCountry)")) {
                            ForEach(apiManager.articles.prefix(5)) { article in
                                Button(action: { selectedURL = IdentifiableURL(url: article.url)}) {
                                    NewsCell(newsImage: article.urlToImage, newsTitle: article.title)
                                        .frame(height: 40)
                                }
                            }
                        }
                        //News By Category
                        Picker ("Select Category", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) { category in
                                Text(category)
                            }
                        }.pickerStyle(.segmented)
                        
                        Section(header: SectionHeader(title: "Top \(selectedCategory) news")) {
                            ForEach(apiManager.categoryArticles.prefix(10)) { article in
                                Button(action: { selectedURL = IdentifiableURL(url: article.url)}) {
                                    NewsCell(newsImage: article.urlToImage, newsTitle: article.title)
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
                    
                    //MARK: - Picker
                    ToolbarItem{
                        Picker("", selection: $selectedCountry) {
                            ForEach(countries, id: \.1){ country in
                                Text(country.0).tag(country.1)}
                        }
                        .pickerStyle(MenuPickerStyle())
                        .tint(.pink)
                    }
                    ToolbarItem{
                        Button(action: {

                        }){
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.pink)
                        }
                    }
                }
                
                //MARK: - Safari View
                .sheet(item: $selectedURL) { identifiableURL in
                    SafariView(url: identifiableURL.url)
                }
                
            }
            
            .onAppear{
                apiManager.fetchTopHeadlines(for: selectedCountry)
                apiManager.fetchNewsByCategory(for: selectedCategory)

            }
            .onChange(of: selectedCountry) { newCountry in
                          apiManager.fetchTopHeadlines(for: newCountry)  // Update headlines when country changes
                      }
            .onChange(of: selectedCategory) { newCategory in
                apiManager.fetchNewsByCategory(for: newCategory)  // Update headlines when country changes
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





