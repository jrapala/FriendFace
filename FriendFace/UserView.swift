//
//  UserView.swift
//  FriendFace
//
//  Created by Juliette Rapala on 11/24/20.
//

import SwiftUI

struct UserView: View {
    var user: User

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Text("Name:")
                    .fontWeight(.bold)
                    .frame(width: 85, alignment: .leading)
                Text(user.name)
            }
            HStack(alignment: .top) {
                Text("Age:")
                    .fontWeight(.bold)
                    .frame(width: 85, alignment: .leading)
                Text(String(user.age))
            }
            HStack(alignment: .top) {
                Text("Company:")
                    .fontWeight(.bold)
                    .frame(width: 85, alignment: .leading)
                Text(user.company)
            }
            HStack(alignment: .top) {
                Text("Email:")
                    .fontWeight(.bold)
                    .frame(width: 85, alignment: .leading)
                Text(user.email)
            }
            HStack(alignment: .top) {
                Text("About:")
                    .fontWeight(.bold)
                    .frame(width: 85, alignment: .leading)
                Text(user.about)
            }
            HStack(alignment: .top) {
                Text("Friends:")
                    .fontWeight(.bold)
                    .frame(width: 85, alignment: .leading)
                VStack(alignment: .leading) {
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                    }
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(
            name: "Alford Rodriguez",
            age: 21,
            company: "Imkan",
            email: "alfordrodriguez@imkan.com",
            address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
            about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.\r\n",
            registered: Date(),
            tags: [
                "cillum",
                "consequat",
                "deserunt",
                "nostrud",
                "eiusmod",
                "minim",
                "tempor"
            ],
            friends: [
                Friend(name: "Hawkins Patel"),
                Friend(name: "Jewel Sexton"),
                Friend(name: "Berger Robertson"),
                Friend(name: "Hess Ford"),
                Friend(name: "Bonita White"),
            ]
        )
        return UserView(user: user)
    }
}
