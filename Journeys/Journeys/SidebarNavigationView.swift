//
//  SidebarNavigationView.swift
//  Journeys
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct SidebarNavigationView: View {
    @EnvironmentObject var locations: Locations
    @State private var selection: String?
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                NavigationLink(destination: DiscoverView(location: locations.primary)) {
                    Image(systemName: "airplane.circle.fill")
                        .imageScale(.large)
                    Text("Discover")
                }
                .tag("Discover")
                
                NavigationLink(destination: PicksView()) {
                    Image(systemName: "star.fill")
                        .imageScale(.large)
                    Text("Picks")
                }
                .tag("Picks")
                
                NavigationLink(destination: MapView()) {
                    Image(systemName: "map.fill")
                        .imageScale(.large)
                    Text("Maps")
                }
                .tag("Maps")
                
                NavigationLink(destination: TipsView()) {
                    Image(systemName: "list.bullet")
                        .imageScale(.large)
                    Text("Tips")
                }
                .tag("Tips")
            }
            .navigationTitle("Journeys")
            .listStyle(SidebarListStyle())
            
            DiscoverView(location: locations.primary)
        }
    }
}

struct SidebarNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarNavigationView()
            .environmentObject(Locations())
    }
}
