//
//  HomeDataSource.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class HomeDataSource: NSObject {
	
	var items: [ClientModel] = []
}

extension HomeDataSource: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return self.items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
		let model = items[indexPath.row]
		
		cell.model = model
		
		return cell
	}
}
