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
        Text(K.Information.description)
            .fontWeight(.medium)
            .font(.title3)
            .foregroundColor(Color(K.Color.primary))
        DatePicker("Select the date:",
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
        }
        .previewLayout(.sizeThatFits)
        .padding()
        .environmentObject(ContentViewModel())
    }
}
