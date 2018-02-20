//
//  RegistrationFieldCell.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializers -

final class RegistrationFieldCell: UITableViewCell {
	
	@IBOutlet private var textField: UITextField!
	
	private var line: CALayer!
	
	var model: RegistrationCellProtocol? {
		didSet {
			updateUI()
		}
	}
}

// MARK: - Life Cycle -

extension RegistrationFieldCell {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		textField.delegate = self
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		line = makeBottomLine(with: textField.frame)
	}
}

// MARK: - Methods -

extension RegistrationFieldCell {
	
	func setTextFieldFocus() {
		DispatchQueue.main.async {
			self.textField.becomeFirstResponder()
		}
	}
	
	private func updateUI() {
		guard let model = model as? RegistrationFieldModel else { return }
		setKeyboardBarAction(model: model)
		setProperties(for: model)
	}
	
	private func setKeyboardBarAction(model: RegistrationFieldModel) {
		model.keyboardCustomView?.buttonAction = { [weak self] in
			self?.postKeyboardButtonObserver()
		}
	}
	
	private func setProperties(for model: RegistrationFieldModel) {
		DispatchQueue.main.async {
			self.textField.placeholder = model.placeholder
			self.textField.keyboardType = model.keyboardType
			self.textField.returnKeyType = model.keyboardButton
			self.textField.inputAccessoryView = model.keyboardCustomView?.view
			self.textField.autocapitalizationType = model.textCapitalization
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
	
	private func postKeyboardButtonObserver() {
		if let model = model as? RegistrationFieldModel {
			NotificationCenter.default.post(name: Observer.Registration.kPressedKeyboardButton, object: model)
		}
	}
}

// MARK: - UITextFieldDelegate -

extension RegistrationFieldCell : UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		postKeyboardButtonObserver()
		
		return true
	}
}
