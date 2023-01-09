//
//  DynamicLoadController.swift
//  DynamicLoadController
//
//  Created by Maxim Shnirman on 24/12/2020.
//  Copyright © 2023 Maxim Shnirman. All rights reserved.
//

import UIKit

class DynamicLoadController: UITableViewController {
	
	private let heightForRow: CGFloat = 263.0
	private let dataFetcher = DataFetcher()
	
	var dataModel: [DynamicDataModel] = [] {
		didSet {
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataFetcher.fetchData { (modelArray) in
			self.dataModel = modelArray ?? [DynamicDataModel]()
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataModel.count
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return heightForRow
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "dynamicCell", for: indexPath) as! DynamicCell
		cell.setupCell(data: dataModel[indexPath.row])
		return cell
	}
	
}
