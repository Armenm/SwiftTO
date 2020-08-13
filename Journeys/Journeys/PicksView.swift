//
//  PicksView.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

struct Place: View {
    let location: Location
    
    var body: some View {
        ZStack {
            Image("\(location.pictures[0])")
                .resizable()
                .scaledToFill()
                .clipped()
            Rectangle()
                .background(Color.black)
                .opacity(0.2)
            Text(location.country)
                .foregroundColor(.white)
                .font(.headline)
            
        }
    }
}

struct PlaceVertical: View {
    let location: Location
    
    var body: some View {
        VStack {
            Image("\(location.country)")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(location.name)
                .font(.title3)
            Text(location.country)
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
        )
        .shadow(color: Color.black.opacity(0.2), radius: 10)
        .padding()
    }
}

struct PicksView: View {
    @EnvironmentObject var locations: Locations
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
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
            
            
            LazyVGrid(columns: layout, spacing: 0) {
                ForEach(locations.places, id: \.id) { location in
                    NavigationLink(destination: DiscoverView(location: location)) {
                        Place(location: location)
                    }
                }
            }
            
            LazyVGrid(columns: layout, alignment: .center, spacing: 0) {
                ForEach(locations.places, id: \.id) { location in
                    NavigationLink(destination: DiscoverView(location: location)) {
                        PlaceVertical(location: location)
                    }
                }
            }
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
