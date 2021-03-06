//
//  SamplesView.swift
//  PerformanceSwiftUI
//
//  Created by Alexandr Glushchenko on 06.03.2021.
//

import SwiftUI
import Combine

struct SamplesView: View {
    @EnvironmentObject var data: TestListData
    @StateObject var dumbState = DumbState()

    var body: some View {
        NavigationView {
            List {
                Group {
                    NavigationLink(
                        destination: LazyView(ViewWithoutBindedState()),
                        label: {
                            Text("0. View Without Binded State")
                        })
                    NavigationLink(
                        destination: LazyView(ViewWithoutBindedState2(state: dumbState)),
                        label: {
                            Text("1. View Without Binded State")
                        })
                    NavigationLink(
                        destination: LazyView(ViewWithBindedState()),
                        label: {
                            Text("2. View With Binded State")
                        })
                    NavigationLink(
                        destination: LazyView(ViewWithBindedState2()),
                        label: {
                            Text("3. View With Binded State (2 variant)")
                        })
                    NavigationLink(
                        destination: LazyView(RedrawComponents()),
                        label: {
                            Text("4. Test Redraw Components")
                        })
                    NavigationLink(
                        destination: LazyView(TestRedrawView()),
                        label: {
                            Text("5. Test View redrawing - direct")
                        })
                    NavigationLink(
                        destination: RedrawRoot(),
                        label: {
                            Text("6. Test View redrawing - over proxy")
                        })
                    NavigationLink(
                        destination: LazyView(List_VStack()),
                        label: {
                            Text("7. VStack")
                        })
                    NavigationLink(
                        destination: LazyView(List_LazyVStack()),
                        label: {
                            Text("8. LazyVStack")
                        })
                    NavigationLink(
                        destination: LazyView(List_List()),
                        label: {
                            Text("9. Simple List")
                        })
                }
                NavigationLink(
                    destination: LazyView(TestList()),
                    label: {
                        Text("10. List with buttons")
                    })
                Button(action: {
                    data.counter2 += 1
                }, label: {
                    Text("\(data.counter2)")
                })
                NavigationLink(
                    destination: MyCounter(),
                    label: {
                        Text("11. Counter")
                    })
                NavigationLink(
                    destination: LazyView(DrawingTest()),
                    label: {
                        Text("12. Drawing")
                    })
            }
            .navigationBarTitle("SwiftUI Performance Samples", displayMode: .inline)
        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                print("change value")
//                dumbState.name = "newValue"
//            }
//        }
    }
}

struct SamplesView_Previews: PreviewProvider {
    static var previews: some View {
        SamplesView()
    }
}
