//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List(0..<100) { _ in
        Label {
            Text("Home")
                .foregroundColor(.red)
                .padding()
        } icon: {
            Image(systemName: "house.fill")
                .padding()
                .overlay(
                    Rectangle()
                        .stroke(Color.red, lineWidth: 4)
                )
                .padding()
        }
        .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
