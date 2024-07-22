//
//  CountryModel.swift
//  FreshCart
//
//  Created by Maaz Khan on 19/07/2024.
//

import Foundation

struct Country: Identifiable, Decodable {
    let id: String
    let name: String
    let flag: String
    let code: String
    let dial_code: String
    let pattern: String
    let limit: Int
}
