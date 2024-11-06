//
//  ContentView.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                
                VStack {
                     //List of News Cell
                    List {
                        
                        Section(header: Text("Today's top stories")
                            .foregroundStyle(.pink)
                            .fontWeight(.semibold)
                            .padding(.leading, -25)
                        ){
                            ForEach(0..<4, id: \.self) { index in
                                NewsCell(NewsImage: "newspaper", NewsTitle: "7 new washington post articles that will change your life")
                                    .frame(height: 40)
                            }

                        }
                        
                        Section(header: Text("Today's tech stories")
                            .foregroundStyle(.pink)
                            .fontWeight(.semibold)
                            .padding(.leading, -25)
                        ){
                            ForEach(0..<3, id: \.self) { index in
                                NewsCell(NewsImage: "newspaper", NewsTitle: "7 new washington post articles that will change your life")
                                    .frame(height: 40)
                            }

                        }
                    }
                    
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation){
                    //Todays Date formatted to day and month
                    VStack(alignment: .leading){
                    
                        
                        Text(currentMonthAndDay())
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
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }){
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.pink)

                    }
                }
            }
        }
    }
    
    func currentMonthAndDay() -> String {
          let date = Date()
          let formatter = DateFormatter()
          formatter.dateFormat = "MMMM d" // "MMMM" for full month name and "d" for the day
          return formatter.string(from: date)
      }
}

#Preview {
    ContentView()
}





