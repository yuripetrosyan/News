//
//  NewsCellRegular.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI

struct NewsCellRegular: View {
    var body: some View {
        
        NewsCell(newsImage: "newspaper", newsTitle: "7 key takeaways from the latest Apple event and it brought some thing s")
    }
}

struct NewsCell: View {
    var newsImage: String
    var newsTitle: String
    
    var body : some View {
        HStack(spacing: 20) {
            Image(systemName: newsImage)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(newsTitle)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .foregroundColor(.primary)
                
        }
        .frame(height: 50)
        //.padding()
    }
}


#Preview {
    NewsCellRegular()
}
