//
//  ContentView.swift
//  BarkingLotClip
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            SelectStoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
