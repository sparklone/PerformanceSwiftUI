//
//  ViewWithoutBindedState.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI
import Combine

fileprivate struct ViewState/*: Equatable*/ {
    var name: String = "" {
        didSet {
            GlobalState.shared.value.userName = name
        }
    }
}

fileprivate extension GlobalState {
    var viewState: ViewState {
        .init(name: userName)
    }
}


struct ViewWithBindedState2: View {
    @State private var state = ViewState()

    private var updateModel: AnyPublisher<ViewState, Never> {
        GlobalState.shared
            .map { $0.viewState }
            //.removeDuplicates()
            .print("after removeDuplicates")
            .eraseToAnyPublisher()
    }

    init() {
        print("ViewWithBindedState2 init")
    }

    var body: some View {
        print("ViewWithBindedState2 body")
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
        .onReceive(updateModel, perform: { state = $0 })
    }

}
