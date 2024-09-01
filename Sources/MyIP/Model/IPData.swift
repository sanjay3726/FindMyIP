//
//  IPData.swift
//  FindMyIP
//
//  Created by Sanjay Yadav on 29/08/24.
//

import Foundation

struct IPData: Codable {
    let ip: String
    let city: String
    let region: String
    let country: String
    let latitude: Double
    let longitude: Double
    let org: String
}
