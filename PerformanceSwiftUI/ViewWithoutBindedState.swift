//
//  ViewWithoutBindedState.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI
import Combine

class DumbState: ObservableObject {
    @Published var name: String = "test"
}

struct ViewWithoutBindedState: View {
    @StateObject private var state = DumbState()
    init() {
        print("ViewWithoutBindedState init")
    }

    var body: some View {
        print("ViewWithoutBindedState body")
        return Text("constant text")
//            .onAppear {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    print("change value")
//                    state.name = "newValue"
//                }
//            }
    }

}

struct ViewWithoutBindedState_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithoutBindedState()
    }
}
