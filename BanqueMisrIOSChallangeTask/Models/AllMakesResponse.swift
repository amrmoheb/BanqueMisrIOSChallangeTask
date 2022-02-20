// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let allMakesResponse = try? newJSONDecoder().decode(AllMakesResponse.self, from: jsonData)

import Foundation

// MARK: - AllMakesResponse
struct AllMakesResponse: Codable {
    let totalNumber, totalPages: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable  {
    
    let id: Int
    let name, niceName, adTargetID, niceID: String
    let useInUsed, useInNew, useInPreProduction, useInFuture: UseIn
    let attributeGroups: AttributeGroups
    let models: [Model]

    enum CodingKeys: String, CodingKey {
        case id, name, niceName
        case adTargetID = "adTargetId"
        case niceID = "niceId"
        case useInUsed, useInNew, useInPreProduction, useInFuture, attributeGroups, models
    }
}

// MARK: - AttributeGroups
struct AttributeGroups: Codable {
}

// MARK: - Model
struct Model: Codable {
    let id, name, niceName, href: String
}

enum UseIn: String, Codable {
    case n = "N"
    case y = "Y"
}
