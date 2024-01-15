//
//  PageView.swift
//  OnboardingDemo
//
//  Created by Sharvari on 2024-01-15.
//

import Foundation
import SwiftUI

struct PageView: View {
    var data: Onboarding
    var body: some View {
        ZStack{
            VStack(alignment: .center) {
                Image(systemName: data.image)
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(data.title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Text(data.desc)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}
