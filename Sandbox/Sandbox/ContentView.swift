//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    var name: String
    var children: [Person]?
}

struct ContentView: View {
    var people: [Person] {
        let sophie = Person(name: "Sophie")
        let lottie = Person(name: "Lottie")
        let john = Person(name: "John")
        let paul = Person(name: "Paul", children: [sophie, lottie])
        let andrew = Person(name: "Andrew", children: [john])
        let terry = Person(name: "Terry", children: [paul, andrew])
        
        return [terry]
    }
    
    var body: some View {
        List(people, children: \.children) { person in
            if person.children != nil {
                Image(systemName: "person")
                Text(person.name)
                    .font(.headline)
            } else {
                Image(systemName: "person.circle")
                Text(person.name)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
