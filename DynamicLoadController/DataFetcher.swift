//
//  DataFetcher.swift
//  DynamicLoadController
//
//  Created by Maxim Shnirman on 24/12/2020.
//  Copyright © 2023 Maxim Shnirman. All rights reserved.
//

import Foundation

class DataFetcher: NSObject {
	// ref: https://pokemontcg.io/
	private let source = "https://api.pokemontcg.io/v1/sets"
	
	func fetchData(completionHandler:@escaping ([DynamicDataModel]?) -> Void) {
		guard let url = URL(string: source) else {
			completionHandler(nil)
			return
		}
		
		let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
			if let _ = error {
				print("error while fetching data \(String(describing: error))")
			} else if let data = data, let responseText = String.init(data: data, encoding: .ascii) {
				let json = responseText.data(using: .utf8)
				let model = try? JSONDecoder().decode(DynamicDataModels.self, from: json!)
				completionHandler(model?.dynamicDataModel)
			}
		})
		
		task.resume()
	}
}
