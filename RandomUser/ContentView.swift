//
//  ContentView.swift
//  RandomUser
//
//  Created by ksd on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel: RandomUserViewModel
    
    private var users: [User] {
        randomUserViewModel.users.sorted{$0.name.last < $1.name.last}
    }
    
    var body: some View {
        NavigationView {
            List(users){ user in
                NavigationLink(destination: Detail(user: user)) {
                    HStack(alignment: .top) {
                        ImageView(user: user)
                        Text("\(user.name.first) \(user.name.last)").font(.title3)
                    }
                    .listRowSeparator(.hidden)
                }.navigationTitle("Users")
            }
        }
    }
}

struct ImageView: View {
    let user: User
    var body: some View {
        let url = URL(string: user.picture.large)!
        AsyncImage(url: url) { image in
            image
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } placeholder: {
            LoadingView()
        }
    }
}


struct LoadingView: View {
    var body: some View {
        HStack{
            Label("Loading", systemImage: "clock")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(.teal)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static let randomUser = RandomUserViewModel()
    
    static var previews: some View {
        ContentView(randomUserViewModel: randomUser)
    }
}
