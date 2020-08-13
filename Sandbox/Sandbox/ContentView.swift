//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var disclosureShowing = false
    
    var body: some View {
        VStack {
            DisclosureGroup("Show saying", isExpanded: $disclosureShowing) {
                Text("The rain in spain is on asdfasdf asdf asdf")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    disclosureShowing.toggle()
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
