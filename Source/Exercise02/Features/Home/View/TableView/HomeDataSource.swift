//
//  HomeDataSource.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class HomeDataSource: NSObject {
	
	private var items: [ClientModel] = [
		ClientModel(companyOwnerName: "João da Silva", companyName: "Coca-Cola"),
		ClientModel(companyOwnerName: "Pedro Paulo", companyName: "Unilever"),
		ClientModel(companyOwnerName: "Rodrigo Oliveira", companyName: "Google"),
		ClientModel(companyOwnerName: "Luciana Brito", companyName: "Apple")
	]
	
//	var items: [ClientModel] = []
}

extension HomeDataSource : UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return items.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell: UserCell = tableView.dequeueReusableCell(for: indexPath)
		let model = items[indexPath.row]
		
		cell.model = model
		
		return cell
	}
}
