//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct PrimaryView: View {
    @State private var selection: Int?
    
    var body: some View {
        List(0..<5, selection: $selection) { i in
            NavigationLink(destination: SupplementaryView(id: i)) {
                Text("Row \(i)")
            }
        }
        .navigationTitle("Folders")
        .listStyle(SidebarListStyle())
    }
}

struct SupplementaryView: View {
    @State private var selection: Int?
    let id: Int
    
    var body: some View {
        List(0..<100, selection: $selection) { i in
            NavigationLink(destination: SecondaryView(group: id, id: i)) {
                Text("Row \(i)")
            }
        }
        .navigationTitle("Notes")
        .listStyle(InsetGroupedListStyle())
    }
}

struct SecondaryView: View {
    let group: Int
    let id: Int
    
    var body: some View {
        Text("Destination \(group)-\(id)")
            .navigationTitle("Notes")
            .listStyle(InsetGroupedListStyle())
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

struct StoreView: View {
    var body: some View {
        Text("Store")
    }
}

struct AccountView: View {
    var body: some View {
        Text("Account")
    }
}

struct SidebarNavigation: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: HomeView()) {
                    Text("HomeView")
                }
                NavigationLink(destination: StoreView()) {
                    Text("StoreView")
                }
                NavigationLink(destination: AccountView()) {
                    Text("Account")
                }
            }
            .listStyle(SidebarListStyle())
        }
    }
}

struct TabNavigation: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("HomeView")
                }
            
            StoreView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("StoreView")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("AccountView")
                }
        }
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact {
            TabNavigation()
        } else {
            SidebarNavigation()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
