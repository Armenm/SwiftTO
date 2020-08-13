//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import MapKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            TabView {
                ForEach(1...8, id: \.self) { i in
                    GeometryReader { geo in
                        Image("photo\(i)")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geo.size.width)
                    }
                }
            }
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
