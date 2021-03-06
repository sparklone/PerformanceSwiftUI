//
//  StringRowWithBinding.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct StringRowWithBinding: View {
    @Binding var text: String

    init(text: Binding<String> ) {
        self._text = text
        print("create: \(text.wrappedValue)")
    }
    var body: some View {
        print("draw: \(text)")
        return Text(text)
    }
}

