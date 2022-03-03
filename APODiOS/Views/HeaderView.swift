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
        Text(K.name)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color(K.primary))
        Text(K.description1)
            .fontWeight(.medium)
        Text(K.description2)
            .foregroundColor(Color(K.secondary))
            .font(.caption)
        DatePicker("Select the day:",
                   selection: $viewModel.selectedDate,
                   in: viewModel.dateClosedRange,
                   displayedComponents: .date)
            .foregroundColor(Color(K.secondary))
            .preferredColorScheme(.dark)
            .disabled(viewModel.apod == nil ? true : false)
    }
}
