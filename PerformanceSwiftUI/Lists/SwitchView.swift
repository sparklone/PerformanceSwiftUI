//
//  SwitchView.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct View1: View {
    var body: some View {
        Text("View1")
    }
}

struct View2: View {
    var body: some View {
        Text("View2")
    }
}

struct View3: View {
    var body: some View {
        Text("View3")
    }
}

enum ViewTypes {
    case view1
    case view2
    case view3
}

struct SwitchView: View {
    var body: some View {
        getView(type: .view2)
    }

    @ViewBuilder
    private func getView(type: ViewTypes) -> some View {
        switch type {
            case .view1:
                View1()
            case .view2:
                View2()
            case .view3:
                View3()
        }
    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
