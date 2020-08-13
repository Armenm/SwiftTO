//
//  TabBarView.swift
//  Journeys
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject var locations: Locations
    
    var body: some View {
        TabView {
            DiscoverView(location: locations.primary)
                .tabItem {
                    Label("Discover", systemImage: "airplane.circle.fill")
                }
            
            NavigationView {
                PicksView()
            }
            .tabItem {
                Label("Picks", systemImage: "star.fill")
            }
            
            NavigationView {
                MapView()
            }
            .tabItem {
                Label("Maps", systemImage: "map.fill")
            }
            
            NavigationView {
                TipsView()
            }
            .tabItem {
                Label("Tips", systemImage: "list.bullet")
            }
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
            .environmentObject(Locations())
    }
}
