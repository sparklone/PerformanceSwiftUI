//
//  List_LazyVStack.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct List_LazyVStack: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<100, content: IntRow.init)
            }
        }
    }
}

