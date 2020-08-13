//
//  TipsView.swift
//  Journeys
//
//  Created by Paul Hudson on 06/07/2020.
//

import SwiftUI

struct Tip: Decodable, Identifiable {
    enum CodingKeys: CodingKey {
        case title, body
    }

    let id = UUID()
    let title: String
    let body: String
}

struct StructuredTip: Identifiable {
    var id: String { content }
    var content: String
    var children: [StructuredTip]?
}

struct TipsView: View {
    let tips = Bundle.main.decode([Tip].self, from: "tips.json")
    
    var flattenedTips: [StructuredTip] {
        var returnValue = [StructuredTip]()
        
        for tip in tips {
            let child = StructuredTip(content: tip.body)
            let parent = StructuredTip(content: tip.title, children: [child])
            
            returnValue.append(parent)
        }
        
        return returnValue
    }

    var body: some View {
        List(flattenedTips, children: \.children) { tip in
            VStack(alignment: .leading) {
                if tip.children != nil {
                    Text(tip.content)
                        .font(.headline)
                } else {
                    Text(tip.content)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Tips")
    }
}

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        PicksView()
    }
}
