//
//  UserProvider.swift
//  NeedleSwiftUI
//
//  Created by Karagiorgos, Michalis, Vodafone Greece on 22/07/2021.
//

import Foundation

protocol UserProviderProtocol {
    func save(_ user: User)  throws
    func canLoadUser(with username: String) -> Bool
    func validate(_ user: User) -> Bool
    func canLoadUsers() -> Bool
}

struct UserProvider: UserProviderProtocol {
    private let userDefaults: UserDefaults

    enum Error: Swift.Error {
        case usernameExists
        case noUsers
        case usernameDoesNotExist
    }

    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }

    func save(_ user: User) throws {
        if let users = loadUsers() {
            var users = users
            guard !canLoadUser(with: user.username) else  { throw Error.usernameExists }
            users[user.username] = user
            userDefaults.set(object: users, forKey: "app_users")
        } else {
            userDefaults.set(object: [user.username: user], forKey: "app_users")
        }
    }

    func canLoadUser(with username: String) -> Bool {
        guard let users = loadUsers() else { return false }
        guard let _ = users[username] else { return false }
        return true
    }

    func validate(_ user: User) -> Bool {
        guard let users = loadUsers() else { return false }
        guard let savedUser = users[user.username] else { return false }
        guard user.password == savedUser.password else { return false }
        return true
    }

    func canLoadUsers() -> Bool {
        guard let _ = loadUsers() else { return false }
        return true
    }

    private func loadUsers() -> [String: User]? {
        return userDefaults.object([String: User].self, with: "app_users")
    }
}

struct User: Codable {
    let username: String
    let password: String
}
