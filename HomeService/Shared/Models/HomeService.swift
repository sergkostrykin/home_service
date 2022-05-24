//
//  HomeService.swift
//  HomeService
//
//  Created by Sergiy Kostrykin on 24.05.2022.
//

import Foundation

struct HomeService: Codable {
    let id: Int?
    let name: String?
    let slug: String?
    let homeImageUrl: String?
    let imageThumbUrl: Image?
    let iconThumbUrl: Image?
    let isLastNode: Bool?
    let serviceTypes: [ServiceType]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case homeImageUrl = "home_image_url"
        case imageThumbUrl = "image_thumb_url"
        case iconThumbUrl = "icon_thumb_url"
        case isLastNode = "is_last_node"
        case serviceTypes = "service_types"
    }
}

struct Image: Codable {
    let lg: String?
    let md: String?
    let sm: String?
}


struct ServiceType: Codable {
    let id: Int?
    let name: String?
    let slug: String?
    let imageThumbUrl: Image?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case imageThumbUrl = "image_thumb_url"
    }
}
