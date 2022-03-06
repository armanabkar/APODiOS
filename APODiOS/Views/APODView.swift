//
//  APODView.swift
//  APOD
//
//  Created by Arman Abkar on 2/28/22.
//

import SwiftUI

struct APODView: View {
    
    var title: String
    var copyright: String
    var explanation: String
    var url: String
    var media_type: String
    
    var body: some View {
        VStack(spacing: 15) {
            if media_type == "video" {
                Link(destination: URL(string: url)!) {
                    Image(K.Image.youtube)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                }
            } else {
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color(K.Color.primary)
                        .opacity(0)
                        .frame(height: 350)
                }
                .cornerRadius(10)
                .frame(height: 350)
            }
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Text(copyright)
                .font(.callout)
                .foregroundColor(Color(K.Color.secondary))
            Text(explanation)
        }
    }
}

struct APODView_Previews: PreviewProvider {
    static var previews: some View {
        APODView(title: K.Placeholder.title,
                 copyright: K.Placeholder.copyright,
                 explanation: K.Placeholder.explanation,
                 url: "https://commons.wikimedia.org/wiki/Category:Galaxies#/media/File:NGC_4414_(NASA-med).jpg",
                 media_type: "image")
            .previewLayout(.sizeThatFits)
    }
}
