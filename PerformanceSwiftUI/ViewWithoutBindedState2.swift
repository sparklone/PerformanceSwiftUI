//
//  ViewWithoutBindedState2.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI
import Combine

struct ViewWithoutBindedState2: View {
    @ObservedObject var state: DumbState

    var body: some View {
        print("ViewWithoutBindedState2 body")
        return Text("constant text")
    }

}
