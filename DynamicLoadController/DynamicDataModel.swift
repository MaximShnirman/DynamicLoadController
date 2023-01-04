//
//  DynamicDataModel.swift
//  PendoLegacyDevelopmentApp
//
//  Created by Maxim Shnirman on 24/12/2020.
//  Copyright © 2020 Pendo.io. All rights reserved.
//

import Foundation

struct DynamicDataModels: Codable {
	var dynamicDataModel: [DynamicDataModel]
	
	enum CodingKeys: String, CodingKey {
		case dynamicDataModel = "sets"
	}
}

struct DynamicDataModel: Codable {
	var code: String
	var ptcgoCode: String?
	var name: String
	var series: String
	var totalCards: Int
	var standardLegal: Bool
	var expandedLegal: Bool
	var releaseDate: String
	var updatedAt: String
	var symbolUrl: String
	var logoUrl: String
	
	enum CodingKeys: String, CodingKey {
		case code, ptcgoCode, name, series, totalCards, standardLegal, expandedLegal, releaseDate, updatedAt, symbolUrl, logoUrl
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		code = try container.decode(String.self, forKey: .code)
		ptcgoCode = try container.decodeIfPresent(String.self, forKey: .ptcgoCode)
		name = try container.decode(String.self, forKey: .name)
		series = try container.decode(String.self, forKey: .series)
		totalCards = try container.decode(Int.self, forKey: .totalCards)
		standardLegal = try container.decode(Bool.self, forKey: .standardLegal)
		expandedLegal = try container.decode(Bool.self, forKey: .expandedLegal)
		releaseDate = try container.decode(String.self, forKey: .releaseDate)
		updatedAt = try container.decode(String.self, forKey: .updatedAt)
		symbolUrl = try container.decode(String.self, forKey: .symbolUrl)
		logoUrl = try container.decode(String.self, forKey: .logoUrl)
	}
}
