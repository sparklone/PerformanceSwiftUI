//
//  DrawingTest.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct DrawingTest: View {
    @State var count: Float = 0.1
    var body: some View {
        VStack {
            Slider(value: $count)
            GeometryReader { reader in
                ZStack {
                    ForEach(0...Int(count * 100), id: \.self) { _ in
                        Circle()
                            .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                                getColor(),
                                getColor()
                            ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                            .opacity(0.2)
                            .animation(Animation
                                        .interpolatingSpring(stiffness: 0.7, damping: 0.3)
                                        .speed(.random(in: 2...10))
                                        .repeatForever()
                            )
                            .frame(
                                width: CGFloat.random(in: 30...500),
                                height: CGFloat.random(in: 30...500)
                            )
                            .position(
                                x: CGFloat.random(in: 0...reader.size.width),
                                y: CGFloat.random(in: 0...reader.size.height)
                            )
                    }
                }
            }
        }
    }

    private func getColor() -> Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
