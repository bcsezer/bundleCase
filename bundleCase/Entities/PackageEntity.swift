//
//  PackageEntity.swift
//  bundleCase
//
//  Created by cem sezeroglu on 24.11.2023.
//

import Foundation

struct PackageEntity: Codable {
    let id: Int
    let isAdded: Bool
    let name: String
    let description: String
    let index: Int
    let image: String
    let style: Style
    let sourceCount: Int
}

struct Style: Codable {
    let fontColor: String
}
