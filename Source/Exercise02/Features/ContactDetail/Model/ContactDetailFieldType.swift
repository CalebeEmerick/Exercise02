//
//  ContactDetailFieldType.swift
//  Exercise02
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

enum ContactDetailFieldType {
	
	case companyOwner(String)
	case email(String)
	case phone(String)
	case companyName(String)
	case cnpj(String)
	case activeSince(String)
	case isMei(String)
	
	var label: String {
		switch self {
		case .companyOwner:
			return "Proprietário"
		case .email:
			return "E-mail"
		case .phone:
			return "Telefone"
		case .companyName:
			return "Nome Fantasia"
		case .cnpj:
			return "CNPJ"
		case .activeSince:
			return "Empresa ativa desde"
		case .isMei:
			return "É MEI"
		}
	}
	
	var field: String {
		switch self {
		case let .companyOwner(name):
			return name
		case let .email(email):
			return email
		case let .phone(phone):
			return phone
		case let .companyName(name):
			return name
		case let .cnpj(cnpj):
			return cnpj
		case let .activeSince(date):
			return date
		case let .isMei(isMei):
			return isMei
		}
	}
	
	var selectionStyle: UITableViewCellSelectionStyle {
		switch self {
		case .phone, .email:
			return .default
		default:
			return .none
		}
	}
	
	var fieldFont: UIFont {
		switch self {
		case .phone, .email:
			return .systemFont(ofSize: 15, weight: .semibold)
		default:
			return .systemFont(ofSize: 15, weight: .medium)
		}
	}
	
	var fieldColor: UIColor {
		switch self {
		case .phone, .email:
			return Color(hexString: "#2475b0").color
		default:
			return .darkGray
		}
	}
}
