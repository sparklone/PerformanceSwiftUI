//
//  TestRedrawView.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

class Data: ObservableObject {
    @Published var counter = 0

    var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    init() {
        timer
            .map { [weak self] _ in
                guard let self = self else { return 0 }
                print(self.counter)
                return self.counter + 1
            }
            .assign(to: &$counter)
    }

    deinit {
        print("deinit Data")
    }
}
struct TestRedrawView: View {
    @ObservedObject private var data = Data()

    var body: some View {
        print("TestRedrawView body")
        return Text("TestRedrawView")
    }
}

struct TestRedrawView_Previews: PreviewProvider {
    static var previews: some View {
        TestRedrawView()
    }
}
