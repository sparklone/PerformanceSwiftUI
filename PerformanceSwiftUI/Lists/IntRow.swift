//
//  ListRow.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct IntRow: View {
    let id: Int

    var body: some View {
        print("body row \(id)")
        return Text("Row \(id)")
            .font(.title)
            .onAppear {
                print("appear \(id)")
            }
            .onDisappear {
                print("disappear \(id)")
            }
    }

    init(id: Int) {
        print("init row \(id)")
        self.id = id
    }
}


