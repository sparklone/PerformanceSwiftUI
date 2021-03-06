//
//  TestList.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI

class TestListData: ObservableObject {
    @Published var items: [String] = []
    @Published var counter: Int = 0
    @Published var counter2: Int = 0
    lazy var actualItems = $items.removeDuplicates()
}

struct TestList: View {
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @EnvironmentObject var data: TestListData

    init() {
        print("init TestList")
    }

    var body: some View {

        NavigationView {
            VStack {
                List(data.items, id: \.self) { item in
                    SimpleStringRow(text: item)
                    //SimpleStringRowEquatable(text: item)//.equatable()
                }//.id()

//                List(data.items.indices, id: \.self) { index in
//                    StringRowWithBinding(text: $data.items[index])//.equatable()
//                    //StringRowWithBindingEquatable(text: $data.items[index])//.equatable()
//                    //AnyView(StringRowWithBindingEquatable(text: $data.items[index]))//.equatable()
//                }
            }.onDisappear() {
                print("onDisappear TestList")
                timer.upstream.connect().cancel()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    removeButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    sortButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    shuffleButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    addButton()
                }
            }
            .onAppear() {
                print("onAppear TestList")
            }
            .onReceive(timer) { _ in
                //data.items.append(UUID().uuidString)
            }
        }
    }

    private func removeButton() -> some View {
        Button(action: {
            data.items = []
        }, label: {
            Text("Remove")
        })
    }

    private func shuffleButton() -> some View {
        Button(action: {
            let newItems = data.items.shuffled()
            data.items = newItems
//                        data.items = []
//                        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
//                            data.items = newItems
//                        }
        }, label: {
            Text("Shuffle")
        })
    }

    private func sortButton() -> some View {
        Button(action: {
            let newItems = data.items.sorted()
            self.data.items = newItems
            //            data.items = []
            //            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) {
            //                data.items = newItems
            //            }
        }, label: {
            Text("Sort")
        })
    }

    private func addButton() -> some View {
        Button(action: {
            var newItems: [String] = []
            for _ in 0...1000 {
                newItems.append(UUID().uuidString)
            }
            data.items += newItems
        }, label: {
            Text("Add")
        })
    }
}
