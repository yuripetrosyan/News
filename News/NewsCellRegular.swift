//
//  NewsCellRegular.swift
//  News
//
//  Created by Yuri Petrosyan on 05/11/2024.
//

import SwiftUI

struct NewsCellRegular: View {
    var body: some View {
        
        NewsCell(NewsImage: "newspaper", NewsTitle: "7 key takeaways from the latest Apple event and it brought some thing s")
    }
}

struct NewsCell: View {
    var NewsImage: String
    var NewsTitle: String
    
    var body : some View {
        HStack(spacing: 20) {
            Image(systemName: NewsImage)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            Text(NewsTitle)
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
