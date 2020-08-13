//
//  ContentView.swift
//  Sandbox
//
//  Created by Armen Mkrtchyan on 2020-08-13.
//

import SwiftUI

struct ContentView: View {
    @State private var names = ["Chidi", "Eleanor", "Jason", "Tahani"]
    @State private var isVertical = false
    
    @Namespace var animation
    
    var body: some View {
        if isVertical {
            VStack(spacing: 20) {
                ForEach(names, id: \.self) { name in
                    Text(name)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: name, in: animation)
                }
            }
            .transition(.none)
            .onTapGesture {
                withAnimation {
                    names.shuffle()
                    isVertical.toggle()
                }
            }
        } else {
            HStack(spacing: 20) {
                ForEach(names, id: \.self) { name in
                    Text(name)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .matchedGeometryEffect(id: name, in: animation)
                }
            }
            .transition(.none)
            .onTapGesture {
                withAnimation {
                    names.shuffle()
                    isVertical.toggle()
                }
            }
        }
    }
}

extension AnyTransition {
    struct NoneModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
        }
    }
    
    static var none: AnyTransition {
        AnyTransition.modifier(active: NoneModifier(), identity: NoneModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
