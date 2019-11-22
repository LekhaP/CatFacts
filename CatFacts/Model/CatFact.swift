//
//  CatFact.swift
//  CatFacts
//
//  Created by Preeti Lekha on 11/22/19.
//  Copyright © 2019 Preeti Lekha. All rights reserved.
//

import Foundation

struct CatFact: Decodable {
    var fact : String

    init(_ dictionary: [String : Any]) {
        self.fact = dictionary["content"] as? String ?? "Missing Fact"
    }
}
