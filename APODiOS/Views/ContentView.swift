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
        TabView {
            ZStack {
                Color(K.Color.background)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 15) {
                        HeaderView()
                        
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
            .tabItem {
                Image(systemName: "eye")
                Text("Home")
            }
            
            Text("Favorites")
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
        .accentColor(.white)
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
