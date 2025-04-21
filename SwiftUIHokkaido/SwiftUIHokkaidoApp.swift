//
//  SwiftUIHokkaidoApp.swift
//  SwiftUIHokkaido
//
//  Created by Nicolas Frugoni on 17/04/2025.
//

import SwiftUI

@main
struct SwiftUIHokkaidoApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreenFactory().makeHomeScreen()
        }
    }
}

struct HomeScreenFactory {
    func makeHomeScreen() -> some View {
        let viewModel = ViewModel()
        return HomeScreen(viewModel: viewModel)
            .onAppear {
                viewModel.onSuccessGettingTypes(
                    response: FrameworkUIState(cells: [1,2,3,2,2,3])
                )
            }
    }
}

struct ProvidersCellFactory {
    @ViewBuilder
    func makeCell(forType type: Int) -> some View {
        if type == 1 {
            Provider1().cell(for: type)
        } else if type == 2 {
            Provider2().cell(for: type)
        } else if type == 3 {
            Provider3().cell(for: type)
        }
    }
}

struct HomeScreen: View {
    let viewModel: ViewModel
    
    var body: some View {
        TheFramework(
            viewModel: viewModel,
            getCell: ProvidersCellFactory().makeCell(forType:)
        )
    }
}

struct Provider1 {
    @ViewBuilder
    func cell(for type: Int) -> some View {
        HStack {
            Spacer()
            Button("Flights") {
                // Action for Flights button
            }
            .buttonStyle(CircleButtonStyle())
            Button("Hotels") {
                // Action for Hotels button
            }
            .buttonStyle(CircleButtonStyle())
            Button("Cars") {
                // Action for Cars button
            }
            .buttonStyle(CircleButtonStyle())
            Spacer()
        }
        .frame(minHeight: 400)
        .background(.blue)
    }

    struct CircleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(Circle().fill(Color.indigo))
                .foregroundColor(.white)
                .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
                .animation(.easeInOut, value: configuration.isPressed)
        }
    }
}

struct Provider2 {
    func cell(for type: Int) -> some View {
        ProviderView()
    }
    
    struct ProviderView: View {
        @State private var isLoading = true
        
        var body: some View {
            if isLoading {
                ProgressView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0...4)) {
                            isLoading = false
                        }
                    }
            } else {
                VStack(alignment: .leading) {
                    Text("Title")
                        .font(.largeTitle)
                    Text("Subtitle")
                        .font(.subheadline)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0..<5) { index in
                                CardView(index: index)
                            }
                        }
                    }
                }
            }
        }
        struct CardView: View {
            let index: Int
            
            var body: some View {
                VStack {
                    Text("Card \(index)")
                        .padding()
                }
                .frame(minWidth: 100, minHeight: 100)
                .background(Color.gray)
                .cornerRadius(10)
            }
        }
    }
    
}

struct Provider3 {
    func cell(for type: Int) -> some View {
        ProviderView(index: type)
    }
    
    struct ProviderView: View {
        let index: Int
        @State private var isLoading = true
        
        var body: some View {
            if isLoading {
                ProgressView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 2...6)) {
                            isLoading = false
                        }
                    }
            } else {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<5) { index in
                            CardView(index: index)
                        }
                    }
                }
            }
        }

        struct CardView: View {
        let index: Int
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Card \(index)")
                    .padding()
                
                Text("Subtitle")
                    .font(.subheadline)
                    .padding()
            }
            .frame(minWidth: 200, minHeight: 200)
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
    }
}

#Preview {
    HomeScreenFactory().makeHomeScreen()
}
