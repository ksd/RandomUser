//
//  randomUser.swift
//  RandomUser
//
//  Created by ksd on 24/02/2022.
//

import Foundation


struct Result: Decodable {
    let results: [User]
}

struct User: Decodable, Comparable, Identifiable {
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.name.last < rhs.name.last
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name.last == rhs.name.last
    }
    
    var id: String {
        "\(name.first)\(name.last)"
    }
    let name: Name
    let picture: Picture
    
    struct Name: Decodable {
        let first: String
        let last: String
    }

    struct Picture: Decodable {
        let large: String
    }
}

