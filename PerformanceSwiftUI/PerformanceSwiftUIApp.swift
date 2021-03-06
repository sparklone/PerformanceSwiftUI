//
//  PerformanceSwiftUIApp.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 22.02.2021.
//

import SwiftUI
import FPSCounter

@main
struct PerformanceSwiftUIApp: App {
    private let testListDataData = TestListData()
//    private let fpsCounter = FPSCounter()
//    private let fpsCounterDelegate = FPSCounterDelegateImplementation()

    var body: some Scene {
        WindowGroup {
            SamplesView()
                .onAppear {
//                    fpsCounter.delegate = fpsCounterDelegate
//                    fpsCounter.startTracking()
                }
                .environmentObject(testListDataData)
        }
    }
}

class FPSCounterDelegateImplementation: NSObject, FPSCounterDelegate {
    func fpsCounter(_ counter: FPSCounter, didUpdateFramesPerSecond fps: Int) {
        print("fps: \(fps)")
    }


}
