//
//  MapView.swift
//  Journeys
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    var id: String { name }
    let name: String
    let location: CLLocationCoordinate2D
    
    static let london = City(name: "London", location: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
    static let paris = City(name: "Paris", location: CLLocationCoordinate2D(latitude: 48.864716, longitude: 2.349014))
}

struct CountryView: View {
    @State var location: Location
    
    var body: some View {
        Image(location.country)
            .renderingMode(.original)
            .resizable()
            .frame(width: 80, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 4)
            )
    }
}

struct MapView: View {
    @EnvironmentObject var locations: Locations
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations.places) {
    location in
            MapAnnotation(coordinate:  location.coordinate) {
                NavigationLink(destination: DiscoverView(location: location)) {
                    CountryView(location: location)
                }
            }
        }
        .navigationTitle("Vacation Map")
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MapView()
        }
    }
}
