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
        Divider()
            .frame(height: 3)
            .background(Color(K.Color.secondary))
            .cornerRadius(12)
        Text(K.Information.description2)
            .foregroundColor(Color(K.Color.secondary))
            .font(.caption)
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
