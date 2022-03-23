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
                        .frame(height: 300)
                }
                .cornerRadius(10)
                .frame(height: 300)
                .padding(.vertical, 5)
            }
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            if copyright != K.Placeholder.copyright {
                Text(copyright)
                    .font(.callout)
                    .foregroundColor(Color(K.Color.secondary))
            }
            Text(explanation)
        }
    }
}

struct APODView_Previews: PreviewProvider {
    static var previews: some View {
        APODView(title: K.Placeholder.title,
                 copyright: K.Placeholder.copyright,
                 explanation: K.Placeholder.explanation,
                 url: "https://upload.wikimedia.org/wikipedia/commons/c/c3/NGC_4414_%28NASA-med%29.jpg?download",
                 media_type: "image")
        .previewLayout(.sizeThatFits)
        .foregroundColor(Color(K.Color.primary))
        .multilineTextAlignment(.center)
        .padding()
        .background(Color(K.Color.background))
    }
}
