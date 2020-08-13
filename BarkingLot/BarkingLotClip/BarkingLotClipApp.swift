//
//  BarkingLotClipApp.swift
//  BarkingLotClip
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI
import AppClip
import MapKit
import Intents
import IntentsUI

extension Array where Element == URLQueryItem {
    func value(for name: String) -> String? {
        first(where: { $0.name == name})?.value
    }
}

@main
struct BarkingLotClipApp: App {
    @StateObject var model = DataModel(canPurchase: false)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SelectStoreView()
            }
            .environmentObject(model)
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleActivity)
        }
    }
    
    func handleActivity(_ userActivity: NSUserActivity) {
        guard let url = userActivity.webpageURL else { return }
        guard let componenets = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        guard let queryItems = componenets.queryItems else { return }
        
        if let storeId = queryItems.value(for: "store") {
            model.selectedStore = storeId
            print(storeId)
        }
        
        confirmLocation(userActivity: userActivity, queryItems: queryItems)
        
        DispatchQueue.main.async {
            model.canPurchase = true
        }
    }
    
    func confirmLocation(userActivity: NSUserActivity,
                         queryItems: [URLQueryItem]) {
        guard let payload = userActivity.appClipActivationPayload,
              let lat = queryItems.value(for: "latitude"),
              let lon = queryItems.value(for: "longitude"),
              let latitude = Double(lat),
              let longitude = Double(lon) else {
            return
        }
        
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), radius: 100, identifier: "location")
        
        payload.confirmAcquired(in: region) { inRegion, error in
            if inRegion {
                print("inRegion")
                DispatchQueue.main.async {
                    model.canPurchase = true
                }
            }
        }
    }
}
