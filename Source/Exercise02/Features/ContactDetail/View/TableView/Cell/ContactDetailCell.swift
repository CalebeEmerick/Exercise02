//
//  ContactDetailCell.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

final class ContactDetailCell: UITableViewCell {
	
	@IBOutlet private var fieldLabel: UILabel!
	@IBOutlet private var fieldValue: UILabel!
	
	var model: ContactDetailCellModel? {
		didSet {
			updateUI()
		}
	}
	
	private func updateUI() {
		guard let model = model else { return }
		setProperties(for: model)
		selectionStyle = .blue
	}
	
	private func setProperties(for model: ContactDetailCellModel) {
		DispatchQueue.main.async {
			self.selectionStyle = model.selectionStyle
			self.fieldValue.font = model.fieldFont
			self.fieldValue.textColor = model.fieldColor
			self.fieldLabel.text = model.label
			self.fieldValue.text = model.field
		}
	}
}
