//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import MapKit
import SwiftUI

struct ContentView: View {
//    let layout = Array<GridItem>(repeating: GridItem(.flexible()),
//                                 count: 5)
    let layout = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.fixed(50)),
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 50, pinnedViews: .sectionHeaders) {
                Section(header: Text("Meh")) {
                    ForEach(1..<100) { i in
                        RoundedRectangle(cornerRadius: 40)
                            .fill(Color.random())
                            .frame(height: 200)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
