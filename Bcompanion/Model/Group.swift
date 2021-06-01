//
//  Group.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation

struct Group: Decodable {
    let groupName: String
    let groupDescription: String?
    let groupLinks: String?
    let groupPhoto: String?
    let numberOfMembers: String?
    let numberOfHikes: String?
    let upcomingHikes: String?
    let admins: String?
    let hikesHistory: String?
    let members: String?
}
