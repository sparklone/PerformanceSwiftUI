//
//  MyCounter.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

struct MyCounter: View {
    @EnvironmentObject var data: TestListData
    var body: some View {
        Button(action: {
            data.counter2 += 1
        }, label: {
            Text("\(data.counter2)")
        })
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        MyCounter()
    }
}
