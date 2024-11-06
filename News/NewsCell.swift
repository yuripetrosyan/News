//
//  NewsCellRegular.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI


struct NewsCell: View {
    var newsImage: URL?
    var newsTitle: String
    
    var body : some View {
        HStack(spacing: 20) {
            if let newsImage = newsImage {
                AsyncImage(url: newsImage) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "newspaper")
                }
                .frame(width: 50, height: 50)
                .cornerRadius(8)
            } else {
                Image(systemName: "newspaper")
                    .frame(width: 50, height: 50)
                    .cornerRadius(8)

            }
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


//#Preview {
//    NewsCell(newsImage: "newspaper", newsTitle: "7 new interesting facts about the universe")
//}
