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
                    Label("Discover", systemImage: "airplane.circle.fill")
                }
                .tag("Discover")
                
                NavigationLink(destination: PicksView()) {
                    Label("Picks", systemImage: "star.fill")
                }
                .tag("Picks")
                
                NavigationLink(destination: MapView()) {
                    Label("Maps", systemImage: "map.fill")
                }
                .tag("Maps")
                
                NavigationLink(destination: TipsView()) {
                    Label("Tips", systemImage: "list.bullet")
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
