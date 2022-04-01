//
//  Constants.swift
//  APOD
//
//  Created by Arman Abkar on 2/27/22.
//

import Foundation

struct K {
    
    struct Information {
        static let name = "Astronomy Picture of Day"
        static let description1 = "Discover the cosmos!"
        static let footer1 = "This project is powered by NASA Astronomy Picture of the Day API. Each day a different image or photograph of our fascinating universe is featured, along with a brief explanation written by a professional astronomer."
        static let footer2 = "Designed and Developed by"
        static let apiKey = "DEMO_KEY"
        static func baseURL(_ date: String) -> String {
            return "https://api.nasa.gov/planetary/apod?date=\(date)&api_key=\(apiKey)"
        }
    }
    
    struct Placeholder {
        static let title = "Some default placeholder"
        static let copyright = "No credit"
        static let explanation = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum nulla pariatur?"
    }
    
    struct Color {
        static let primary = "primary"
        static let secondary = "secondary"
        static let background = "background"
    }
    
    struct Image {
        static let youtube = "youtube"
    }
    
}
