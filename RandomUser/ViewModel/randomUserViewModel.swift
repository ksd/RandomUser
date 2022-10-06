//
//  randomUserViewModel.swift
//  RandomUser
//
//  Created by ksd on 24/02/2022.
//

import Foundation

class RandomUserViewModel: ObservableObject {
    
    @Published var users: [User] = []

    private func fetchData() async throws -> Data? {
        // 1. lave en URL
        let url = URL(string: "https://randomuser.me/api/?results=50")!
        // 2. Opret en session
        let session = URLSession.shared
        // 3. hent data
        let (data, response) = try await session.data(from: url)
        let httpResponse = response as! HTTPURLResponse
        if httpResponse.statusCode == 200 {
            return data
        }
        else {
            return nil
        }
    }


    init(){
        Task {
            let data = try! await fetchData()
            if let data = data {
                let decoder = JSONDecoder()
                let randomUser = try! decoder.decode(Result.self, from: data)
                randomUser.results.forEach { user in
                    users.append(user)
                }
            }
        }
    }
}
