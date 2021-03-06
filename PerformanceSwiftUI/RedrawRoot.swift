//
//  RedrawRoot.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct RedrawRoot: View {
    var body: some View {
        NavigationLink(
            destination: TestRedrawView(),
            label: {
                Text("Navigate to TestRedrawView")
            })
    }
}

struct RedrawRoot_Previews: PreviewProvider {
    static var previews: some View {
        RedrawRoot()
    }
}
