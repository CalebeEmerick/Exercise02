//
//  RegistrationFieldType.swift
//  Exercise02
//
//  Created by Calebe Emerick on 19/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

enum RegistrationFieldType {
	
	case name(String)
	case email(String)
	case phone(String)
	case companyName(String)
	case cnpj(String)
}

extension RegistrationFieldType : Equatable {
	
	static func ==(lhs: RegistrationFieldType, rhs: RegistrationFieldType) -> Bool {
		switch (lhs, rhs) {
		case (let .name(placeholder), let .name(placeholder2)):
			return placeholder == placeholder2
		case (let .email(placeholder), let .email(placeholder2)):
			return placeholder == placeholder2
		case (let .phone(placeholder), let .phone(placeholder2)):
			return placeholder == placeholder2
		case (let .companyName(placeholder), let .companyName(placeholder2)):
			return placeholder == placeholder2
		case (let .cnpj(placeholder), let .cnpj(placeholder2)):
			return placeholder == placeholder2
		default:
			return false
		}
	}
}

extension RegistrationFieldType {
	
	var placeholder: String {
		switch self {
		case let .name(placeholder):
			return placeholder
		case let .email(placeholder):
			return placeholder
		case let .phone(placeholder):
			return placeholder
		case let .companyName(placeholder):
			return placeholder
		case let .cnpj(placeholder):
			return placeholder
		}
	}
	
	var lineColor: CGColor {
		return Color(hexString: "#ccc").cgColor
	}
	
	var capitalization: UITextAutocapitalizationType {
		switch self {
		case .name, .companyName:
			return .words
		case .email, .phone, .cnpj:
			return .none
		}
	}
	
	var keyboardType: UIKeyboardType {
		switch self {
		case .name:
			return .default
		case .email:
			return .emailAddress
		case .phone:
			return .numberPad
		case .companyName:
			return .default
		case .cnpj:
			return .numberPad
		}
	}
	
	var keyboardButton: UIReturnKeyType {
		return .next
	}
	
	var keyboardCustomView: KeyboardAccessoryView? {
		switch self {
		case .phone, .cnpj:
			return KeyboardAccessoryView(button: "Próximo")
		default:
			return nil
		}
	}
}
