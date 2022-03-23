//
//  ContentView.swift
//  APODiOS
//
//  Created by Arman Abkar on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var viewModel: ContentViewModel
    
    var body: some View {
        ZStack {
            Color(K.Color.background)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    HeaderView()
                    
                    DatePicker("Select the day:",
                               selection: $viewModel.selectedDate,
                               in: viewModel.dateClosedRange,
                               displayedComponents: .date)
                    .foregroundColor(Color(K.Color.secondary))
                    .preferredColorScheme(.dark)
                    .disabled(viewModel.apod == nil ? true : false)
                    
                    APODView(title: viewModel.title,
                             copyright: viewModel.copyright,
                             explanation: viewModel.explanation,
                             url: viewModel.url,
                             media_type: viewModel.mediaType)
                        .redacted(reason: viewModel.apod == nil ? .placeholder : [])
                    
                    Text(K.Information.footer1)
                        .foregroundColor(Color(K.Color.secondary))
                        .padding(.top)
                    Text("\(K.Information.footer2) [Arman Abkar](https://armanabkar.ir)")
                        .foregroundColor(Color(K.Color.secondary))
                }
                .foregroundColor(Color(K.Color.primary))
            }
            .multilineTextAlignment(.center)
            .padding()
        }
        .task {
            await viewModel.fetchAPOD()
        }
        .onChange(of: viewModel.selectedDate) { newValue in
            Task.init {
                await viewModel.fetchAPOD()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentViewModel())
    }
}
