//
//  NewsCellRegular.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI


struct NewsCell: View {
    var newsImage: String
    var newsTitle: String
    var imageSize: CGFloat = 20
    
    var body : some View {
        HStack(spacing: 20) {
            Image(systemName: newsImage)
                .resizable()
                .scaledToFit()
                .frame(width: imageSize, height: imageSize)
            
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
    NewsCell(newsImage: "newspaper", newsTitle: "7 new interesting facts about the universe")
}
