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
                    Image(systemName: "airplane.circle.fill")
                        .imageScale(.large)
                    Text("Discover")
                }
            
            NavigationView {
                PicksView()
            }
            .tabItem {
                Image(systemName: "star.fill")
                    .imageScale(.large)
                Text("Picks")
            }
            
            NavigationView {
                MapView()
            }
            .tabItem {
                Image(systemName: "map.fill")
                    .imageScale(.large)
                Text("Maps")
            }
            
            NavigationView {
                TipsView()
            }
            .tabItem {
                Image(systemName: "list.bullet")
                    .imageScale(.large)
                Text("Tips")
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
