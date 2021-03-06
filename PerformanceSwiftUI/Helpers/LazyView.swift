//
//  LazyView.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    let build: () -> Content

    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    public var body: Content {
        build()
    }
}
