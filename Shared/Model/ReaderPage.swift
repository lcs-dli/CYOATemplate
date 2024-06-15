//
//  ReaderPage.swift
//  CYOATemplate
//
//  Created by Justin Zack Wei on 2024-06-11.
//

import Foundation
struct ReaderPage: Identifiable, Codable {
    var id: Int?
    var pageId: Int?
    enum CodingKeys: String, CodingKey{
        case id = "reader_id"
        case pageId = "page_id"
    }
}
