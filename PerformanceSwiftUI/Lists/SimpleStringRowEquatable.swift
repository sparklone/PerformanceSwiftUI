//
//  SimpleStringRowEquatable.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct SimpleStringRowEquatable: View, Equatable {
    typealias Row = SimpleStringRowEquatable
    var text: String

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
