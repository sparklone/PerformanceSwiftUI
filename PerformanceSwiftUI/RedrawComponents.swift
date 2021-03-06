//
//  RedrawComponents.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

class RedrawComponentsState: ObservableObject {
    @Published var name = ""
    @Published var age = 16
}

class RedrawComponentsAnotherState: ObservableObject {
    @Published var surname = ""
}

struct RedrawComponents: View {
    @StateObject var state = RedrawComponentsState()
    @StateObject var anotherState = RedrawComponentsAnotherState()
    @State var name = ""

    var body: some View {
        VStack(spacing: 10) {
            Text("Age: \(state.age)")
            Button(action: {
                print("\n---------")
                state.age += 1
            }, label: {
                Text("Increase age")
            })
            Button(action: {
                print("\n---------")
                name += "g"
            }, label: {
                Text("Change local name")
            })
            CustomTextField(id: "State", text: $state.name)
            CustomTextField(id: "AnotherState", text: $anotherState.surname)
            CustomTextField(id: "LocalState", text: $name)

            CustomLabel()
        }
    }
}

struct CustomTextField: View {
    @Binding var text: String
    private let id: String

    init(id: String, text: Binding<String>) {
        self.id = id
        self._text = text
    }
    var body: some View {
        print("\(id) body")
        return TextField("TextField", text: $text)
    }
}

struct CustomLabel: View {
    var body: some View {
        print("CustomLabel body")
        return Text("constant text")
    }
}

struct RedrawComponents_Previews: PreviewProvider {
    static var previews: some View {
        RedrawComponents()
    }
}
