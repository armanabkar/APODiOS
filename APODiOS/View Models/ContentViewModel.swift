//
//  APODViewModel.swift
//  APOD
//
//  Created by Arman Abkar on 2/27/22.
//

import SwiftUI

@MainActor
final class ContentViewModel: ObservableObject {
    
    @Published var apod: APOD?
    @Published var selectedDate = Date()
    
    var title: String {
        return apod?.title ?? K.Placeholder.title
    }
    
    var copyright: String {
        return apod?.copyright ?? K.Placeholder.copyright
    }
    
    var explanation: String {
        return apod?.explanation ?? K.Placeholder.explanation
    }
    
    var url: String {
        return apod?.url ?? ""
    }
    
    var mediaType: String {
        return apod?.media_type ?? "image"
    }
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Date("1995/06/16")
        let max = Date()
        return min...max
    }
    
    func fetchAPOD() async {
        do {
            apod = nil
            apod = try await WebService.shared.fetchAPOD(for: formatDate(date: selectedDate))
        } catch {
            print(error)
        }
    }
    
    private func formatDate(date: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df.string(from: date)
    }
    
}
