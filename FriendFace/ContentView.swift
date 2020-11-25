//
//  ContentView.swift
//  FriendFace
//
//  Created by Juliette Rapala on 11/23/20.
//

import SwiftUI

struct ContentView: View {
    enum LoadingState {
        case loading, loaded, failed
    }

    @State private var users: [User] = []
    @State private var loadingState = LoadingState.loading

    var body: some View {
        NavigationView {
            VStack {
                if loadingState == .loaded {
                    List(users, id: \.id) { user in
                        Text(user.name)
                    }
                } else if loadingState == .loading {
                    Text("Loading…")
                } else {
                    Text("Please try again later.")
                }
            }
            .navigationBarTitle("FriendFace")
            .onAppear(perform: fetchFriends)
        }
    }
    
    func fetchFriends() {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response (not HTTPURLResponse")
                return
            }
            
            let statusCode = response.statusCode
            let statusText = HTTPURLResponse.localizedString(forStatusCode: statusCode)

            if (400...499).contains(statusCode) {
                print("Server responded with client error: \(statusText) (\(statusCode))")
                return
            }
            else if (500..<599).contains(statusCode) {
                print("Server responded with server error: \(statusText) (\(statusCode))")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let users = try? decoder.decode([User].self, from: data) {
                    self.users = users.sorted(by: {$0.name < $1.name})
                    self.loadingState = .loaded
                    return
                }
            } else {
                print("No data received")
            }

        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
