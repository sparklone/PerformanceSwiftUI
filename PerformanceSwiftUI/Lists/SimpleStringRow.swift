//
//  SimpleStringRow.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct SimpleStringRow: View {
    var text: String

    var body: some View {
        print("draw: \(text)")
        return Text(text)
    }
}


struct SimpleStringRow_Previews: PreviewProvider {
    static var previews: some View {
        SimpleStringRow(text: "test")
    }
}
