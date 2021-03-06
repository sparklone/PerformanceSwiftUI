//
//  List-VStack.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct List_VStack: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<100, content: IntRow.init)
            }
        }
    }
}

