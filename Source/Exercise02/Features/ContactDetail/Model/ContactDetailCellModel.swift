//
//  ContactDetailCellModel.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class ContactDetailCellModel {
	
	let fieldType: ContactDetailFieldType
	let selectionStyle: UITableViewCellSelectionStyle
	let fieldFont: UIFont
	let fieldColor: UIColor
	let field: String
	let label: String
	
	init(type: ContactDetailFieldType) {
		fieldType = type
		selectionStyle = type.selectionStyle
		fieldFont = type.fieldFont
		fieldColor = type.fieldColor
		label = type.label
		field = type.field
	}
}
