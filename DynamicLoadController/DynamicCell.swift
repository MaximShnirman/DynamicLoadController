//
//  DynamicCell.swift
//  PendoLegacyDevelopmentApp
//
//  Created by Maxim Shnirman on 24/12/2020.
//  Copyright © 2020 Pendo.io. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {
	
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var subImage: UIImageView!
	@IBOutlet weak var title: UILabel!
	@IBOutlet weak var subTitle: UILabel!
	
	func setupCell(data: DynamicDataModel) {
		mainImage.downloadFrom(link: data.logoUrl, contentMode: .scaleAspectFit)
		subImage.downloadFrom(link: data.symbolUrl, contentMode: .scaleAspectFit)
		title.text = data.name
		subTitle.text = data.releaseDate
	}
}
