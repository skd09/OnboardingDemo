//
//  ContentView.swift
//  OnboardingDemo
//
//  Created by Sharvari on 2024-01-15.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTag = 0
    private var count = OnboardingData.count - 1

    var body: some View {
        NavigationStack {
            TabView(selection: $activeTag){
                ForEach(Array(OnboardingData.enumerated()), id: \.element.id){ (index, item) in
                    PageView(data: item)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .safeAreaInset(edge: .bottom) {
                HStack(alignment: .center){
                    if activeTag > 0 {
                        Button(action: {
                            withAnimation(.easeOut) {
                                if activeTag > 0 {
                                    activeTag -= 1
                                }
                            }
                        }, label: {
                            Text("Back")
                        })
                    }

                    Spacer()
                    HStack{
                        ForEach(OnboardingData.indices, id: \.self){ i in
                            Circle()
                                .fill( i == activeTag ? .blue.opacity(0.5) : .blue)
                                .frame(height: 10)
                        }
                    }
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn) {
                            if activeTag < count {
                                activeTag += 1
                            }
                        }

                    }, label: {
                        Text(activeTag == count ? "Finish" : "Next")
                    })
                }
                .padding()
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Skip")
                    })
                }
            })
        }
    }
}


#Preview {
    ContentView()
}
