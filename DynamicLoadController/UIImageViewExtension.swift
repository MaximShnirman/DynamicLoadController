//
//  UIImageViewExtension.swift
//  DynamicLoadController
//
//  Created by Maxim Shnirman on 24/12/2020.
//  Copyright © 2023 Maxim Shnirman. All rights reserved.
//

import UIKit

private var imageCache = NSMutableDictionary()

extension UIImageView {

	func downloadFrom(link: String?, contentMode mode: UIView.ContentMode) {
		contentMode = mode
		image = UIImage(named: "tools_icon")
		
		guard let link = link, let url = URL(string: link) else {
			self.image = UIImage(named: "tools_icon")
			return
		}
		
		if imageCache[link] != nil {
			DispatchQueue.main.async {
				self.image = imageCache[link] as? UIImage
			}
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				print("error downloading \(String(describing: error))")
				return
			}
			if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
				print("statusCode != 200; \(httpResponse.statusCode)")
				return
			}
			let downloadedImage = UIImage(data: data)
			imageCache.setValue(downloadedImage, forKey: link)
			DispatchQueue.main.async {
				self.image = downloadedImage
			}
		}.resume()
	}
}
