//
//  RegistrationSwitchCell.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class RegistrationSwitchCell: UITableViewCell {
	
	@IBOutlet private var meiLabel: UILabel!
	@IBOutlet private var meiSwitch: UISwitch!
	
	@IBAction private func didChangeState(_ state: UISwitch) {
		viewModel?.isMeiChanged(to: state.isOn)
	}
	
	var viewModel: RegistrationCellSwitchCapture?
	
	var model: RegistrationCellProtocol? {
		didSet {
			updateUI()
		}
	}
}

// MARK: - Methods -

extension RegistrationSwitchCell {
	
	private func updateUI() {
		guard let model = model as? RegistrationSwitchModel else { return }
		viewModel?.isMeiChanged(to: model.switchState)
		setProperties(for: model)
	}
	
	private func setProperties(for model: RegistrationSwitchModel) {
		DispatchQueue.main.async {
			self.meiLabel.text = model.label
			self.meiSwitch.isOn = model.switchState
		}
	}
}
