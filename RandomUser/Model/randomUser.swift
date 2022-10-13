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
    let location: Location
    
    struct Name: Decodable {
        let first: String
        let last: String
    }

    struct Picture: Decodable {
        let large: String
    }
    
    struct Location: Decodable {
        let coordinates: Coordinate
    }
    
    struct Coordinate: Decodable {
        let latitude: String
        let longitude: String
    }
    
    static let demoUser = User(
        name: Name(first: "Ole", last: "Olsen"),
        picture: Picture(large: "https://randomuser.me/api/portraits/men/75.jpg"),
        location: Location(coordinates: Coordinate(latitude: "56.119772138563675", longitude: "10.159000447600846")))
}
