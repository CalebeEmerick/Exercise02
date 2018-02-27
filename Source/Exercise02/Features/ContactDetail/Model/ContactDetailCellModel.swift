//
//  ContactDetailCellModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class ContactDetailCellModel {
	
	let label: String
	let field: String
	
	init(type: ContactDetailFieldType) {
		label = type.label
		field = type.field
	}
}
