//
//  StringRowWithBindingEquatable.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct StringRowWithBindingEquatable: View, Equatable {
    typealias Row = StringRowWithBindingEquatable
    @Binding var text: String

    init(text: Binding<String> ) {
        self._text = text
        print("create: \(text.wrappedValue)")
    }

    var body: some View {
        print("draw: \(text)")
        return Text(text)
    }

    static func == (lhs: Row, rhs: Row) -> Bool {
        let isEqual = lhs.text == rhs.text
        print("check equality: \(isEqual) \(lhs.text) - \(rhs.text)")
        return isEqual
    }
}
