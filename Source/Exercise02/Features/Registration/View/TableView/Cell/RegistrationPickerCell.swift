//
//  RegistrationPickerCell.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class RegistrationPickerCell: UITableViewCell {
	
	@IBOutlet private var label: UILabel!
	@IBOutlet private var textField: UITextField!
	
	private var line: CALayer!
	
	var model: RegistrationCellProtocol? {
		didSet {
			updateUI()
		}
	}
}

// MARK: - Life Cycle -

extension RegistrationPickerCell {
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		line = makeBottomLine(with: textField.frame)
	}
}

// MARK: - Methods -

extension RegistrationPickerCell {
	
	func openPickerKeyboard() {
		DispatchQueue.main.async {
			self.textField.becomeFirstResponder()
		}
	}
	
	private func updateUI() {
		guard let model = model as? RegistrationPickerModel else { return }
		setKeyboardBarAction(model: model)
		setProperties(for: model)
	}
	
	private func setKeyboardBarAction(model: RegistrationPickerModel) {
		model.keyboardCustomView.buttonAction = { [weak self] in
			self?.setSelectedDate(model: model)
			self?.dismissKeyboard()
		}
	}
	
	private func setProperties(for model: RegistrationPickerModel) {
		DispatchQueue.main.async {
			self.textField.placeholder = model.placeholder
			self.textField.inputView = model.keyboardView
			self.textField.inputAccessoryView = model.keyboardCustomView.view
			self.label.text = model.label
			self.line.backgroundColor = model.lineColor
		}
	}
	
	private func makeBottomLine(with frame: CGRect) -> CALayer {
		let line = CALayer()
		let y = frame.origin.y + frame.height
		line.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: 0.5)
		line.backgroundColor = UIColor.lightGray.cgColor
		layer.addSublayer(line)
		return line
	}
	
	private func setSelectedDate(model: RegistrationPickerModel) {
		DispatchQueue.main.async {
			self.textField.text = model.dateConverter.toString(date: model.keyboardView.selectedDate)
		}
	}
	
	private func dismissKeyboard() {
		DispatchQueue.main.async {
			self.textField.endEditing(true)
		}
	}
}
