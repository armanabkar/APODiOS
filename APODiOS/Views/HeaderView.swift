//
//  HeaderView.swift
//  APOD
//
//  Created by Arman Abkar on 2/28/22.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject private var viewModel: ContentViewModel
    
    var body: some View {
        Text(K.Information.name)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(K.Color.primary))
        Text(K.Information.description1)
            .fontWeight(.medium)
        Text(K.Information.description2)
            .foregroundColor(Color(K.Color.secondary))
            .font(.caption)
        DatePicker("Select the day:",
                   selection: $viewModel.selectedDate,
                   in: viewModel.dateClosedRange,
                   displayedComponents: .date)
            .foregroundColor(Color(K.Color.secondary))
            .preferredColorScheme(.dark)
            .disabled(viewModel.apod == nil ? true : false)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            HeaderView()
                .environmentObject(ContentViewModel())
                .previewLayout(.sizeThatFits)
        }
    }
}
