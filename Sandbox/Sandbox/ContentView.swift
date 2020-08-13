//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import MapKit
import SwiftUI

struct City: Identifiable {
    var id: String { name }
    let name: String
    let location: CLLocationCoordinate2D
    
    static let london = City(name: "London", location: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
    static let paris = City(name: "Paris", location: CLLocationCoordinate2D(latitude: 48.864716, longitude: 2.349014))
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let annotations = [City.london, City.paris]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) {
            annotation in
            MapAnnotation(coordinate: annotation.location, anchorPoint: CGPoint(x: 0.5, y: 1)) {
                Image(systemName: "mappin")
                    .imageScale(.large)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
