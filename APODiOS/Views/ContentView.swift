//
//  ContentView.swift
//  APODiOS
//
//  Created by Arman Abkar on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var apod: APOD?
    @State var selectedDate = Date()
    var dateClosedRange: ClosedRange<Date> {
        let min = Date("1995/06/16")
        let max = Date()
        return min...max
    }
    
    func formatDate(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: date)
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
                    
                    VStack(spacing: 15) {
                        DatePicker("Select the day:", selection: $selectedDate, in: dateClosedRange, displayedComponents: .date)
                            .foregroundColor(Color("secondary"))
                            .preferredColorScheme(.dark)
                            .disabled(apod == nil ? true : false)
                        
                        AsyncImage(url: URL(string: apod?.url ?? "")) { image in
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
                        
                        Text(apod?.title ?? "Some default placeholder")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(apod?.copyright ?? "placeholder")
                            .font(.callout)
                        Text(apod?.explanation ?? "Some default placeholder Some default placeholder Some default placeholder Some default placeholder Some default placeholder Some default placeholder Some default placeholder Some default placeholder")
                    }
                    .redacted(reason: apod == nil ? .placeholder : [])
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
        .task {
            apod = try? await WebService.shared.fetchAPOD(for: formatDate(date: selectedDate))
            print(formatDate(date: selectedDate))
        }
        .onChange(of: selectedDate) { newValue in
            apod = nil
            Task.init {
                apod = try? await WebService.shared.fetchAPOD(for: formatDate(date: newValue))
            }
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
