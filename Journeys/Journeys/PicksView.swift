//
//  PicksView.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

struct PicksView: View {
    @EnvironmentObject var locations: Locations
    
    var body: some View {
        ScrollView {
            TabView {
                ForEach(1...8, id: \.self) { i in
                    GeometryReader { geo in
                        Image("photo\(i)")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: geo.size.width)
                            .clipped()
                    }
                }
            }
            .frame(height: 300)
            .padding(.top, 20)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .navigationTitle("Our Top Picks")
    }
}

struct PicksView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PicksView()
        }
        .environmentObject(Locations())
    }
}
