//
//  ClientModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 08/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ClientModel {
	
	let companyOwnerName: String
	let companyName: String
	let ownerInitialsName: String
	
	init(companyOwnerName: String, companyName: String) {
		self.companyOwnerName = companyOwnerName
		self.companyName = companyName
		ownerInitialsName = "CE"
	}
}
