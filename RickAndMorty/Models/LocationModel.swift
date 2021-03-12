//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Malavika Akhilesh on 11/03/21.
//  Copyright © 2021 Malavika Akhilesh. All rights reserved.
//

// MARK: - LocationModel
struct LocationModel: Codable {
    let info: Info
    let results: [Location]
}

// MARK: - Result
struct Location: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
