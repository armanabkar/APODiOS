//
//  ContentView.swift
//  APODiOS
//
//  Created by Arman Abkar on 2/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var viewModel: APODViewModel
    
    var body: some View {
        ZStack {
            Color(K.background)
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    HeaderView()
                    
                    APODView(title: viewModel.apod?.title ?? K.placeholder1,
                             copyright: viewModel.apod?.copyright ?? K.placeholder2,
                             explanation: viewModel.apod?.explanation ?? K.placeholder3,
                             url: viewModel.apod?.url ?? "",
                             media_type: viewModel.apod?.media_type ?? "")
                        .redacted(reason: viewModel.apod == nil ? .placeholder : [])
                    
                    Text(K.footer1)
                        .foregroundColor(Color(K.secondary))
                        .padding(.top)
                    Text(K.footer2)
                        .foregroundColor(Color(K.secondary))
                }
                .foregroundColor(Color(K.primary))
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
            .environmentObject(APODViewModel())
    }
}
