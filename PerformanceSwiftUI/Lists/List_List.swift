//
//  List_List.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct List_List: View {
    var body: some View {
        List(0...100, id: \.self) { id in
            IntRow(id: id)
        }
    }
}


