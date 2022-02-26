//
//  ContentView.swift
//  APODiOS
//
//  Created by Arman Abkar on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedDate = Date()
    var dateClosedRange: ClosedRange<Date> {
        let min = Date("1995/06/16")
        let max = Date()
        return min...max
    }
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    Text("Astronomy Picture of Day")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("primary"))
                    Text("Discover the cosmos!")
                        .fontWeight(.medium)
                    Text("Each day a different image or photograph of our fascinating universe is featured, along with a brief explanation written by a professional astronomer.")
                        .foregroundColor(Color("secondary"))
                        .font(.caption)
                    DatePicker("Select the day:", selection: $selectedDate, in: dateClosedRange, displayedComponents: .date)
                        .foregroundColor(Color("secondary"))
                        .preferredColorScheme(.dark)

                    AsyncImage(url: URL(string: "https://apod.nasa.gov/apod/image/2202/NGC4945-Dietmar-Eric-crop1024.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        Color("primary")
                            .opacity(0)
                            .frame(height: 350)
                    }
                    .cornerRadius(10)
                    .frame(maxHeight: 350)
                    
                    Text("Nearby Spiral Galaxy NGC 4945")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("Dietmar Hager")
                        .font(.callout)
                    Text("Large spiral galaxy NGC 4945 is seen nearly edge-on in this cosmic galaxy close-up. It's almost the size of our Milky Way Galaxy. NGC 4945's own dusty disk, young blue star clusters, and pink star forming regions stand out in the colorful telescopic frame. About 13 million light-years distant toward the expansive southern constellation Centaurus, NGC 4945 is only about six times farther away than Andromeda, the nearest large spiral galaxy to the Milky Way. Though this galaxy's central region is largely hidden from view for optical telescopes, X-ray and infrared observations indicate significant high energy emission and star formation in the core of NGC 4945. Its obscured but active nucleus qualifies the gorgeous island universe as a Seyfert galaxy and home to a central supermassive black hole.")
                }
                .foregroundColor(Color("primary"))
                
                VStack(spacing: 15) {
                    Text("This open-source project is powered by NASA Astronomy Picture of the Day API.")
                    Text("Designed and Developed by Arman Abkar")
                }
                .foregroundColor(Color("secondary"))
                .padding(.top)
            }
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
}
