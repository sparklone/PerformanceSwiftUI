//
//  ViewWithoutBindedState.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI
import Combine

struct GlobalState {
    static let shared = CurrentValueSubject<GlobalState, Never>(GlobalState())
// Can use @Environment/@EnvironmentObject
    var userName = "test"
    var age = 16
}

class ViewWithBindedStateModel: ObservableObject {
    @Published var name: String = "" {
        didSet {
            // workaround
            GlobalState.shared.value.userName = name
        }
    }

    init() {
        GlobalState
            .shared
            .map { $0.userName }
            .print("before remove duplicates")
//            .removeDuplicates()
//            .print("after remove duplicates")
            .assign(to: &$name)
    }
}

struct ViewWithBindedState: View {

    @StateObject var state = ViewWithBindedStateModel()

    init() {
        print("ViewWithBindedState init")
    }

    var body: some View {
        print("ViewWithBindedState body")
        return VStack {
            Text("\(state.name)")
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("\n1. -----------------")
                print("local name change")
                state.name = "newValue (from local)"
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("\n2. -----------------")
                print("local name change (the same)")
                state.name = "newValue (from local)"
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                print("\n3. -----------------")
                print("global name change")
                GlobalState.shared.value.userName = "newValue (from global)"
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                print("\n4. -----------------")
                print("global name change (the same)")
                GlobalState.shared.value.userName = "newValue (from global)"
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                print("\n5. -----------------")
                print("global age change")
                GlobalState.shared.value.age = 25
            }
        }
    }

}

struct ViewWithBindedState_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithBindedState()
    }
}
