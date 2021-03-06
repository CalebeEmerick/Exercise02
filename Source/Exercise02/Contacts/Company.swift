//
//  Company.swift
//  Exercise02
//
//  Created by Calebe Emerick on 07/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

struct Company {

	let name: String
	let cnpj: String
	let activeSince: String
	let isMei: Bool

	init(name: String, cnpj: String, activeSince: String, isMei: Bool) {
		self.name = name
		self.cnpj = cnpj
		self.activeSince = activeSince
		self.isMei = isMei
	}

	private let kName = "name"
	private let kCnpj = "cnpj"
	private let kActiveSince = "active_since"
	private let kIsMei = "is_mei"
}

extension Company {

	init?(json: JSON) {
		guard let name = json[kName] as? String,
			let cnpj = json[kCnpj] as? String,
			let activeSince = json[kActiveSince] as? String,
			let isMei = json[kIsMei] as? Bool
		else {
			return nil
		}

		self.name = name
		self.cnpj = cnpj
		self.activeSince = activeSince
		self.isMei = isMei
	}

	var json: JSON {
		return [
			kName: name,
			kCnpj: cnpj,
			kActiveSince: activeSince,
			kIsMei: isMei
		]
	}
}

extension Company: Equatable {
	
	static func ==(lhs: Company, rhs: Company) -> Bool {
		return lhs.name == rhs.name &&
		lhs.cnpj == rhs.cnpj &&
		lhs.activeSince == rhs.activeSince &&
		lhs.isMei == rhs.isMei
	}
}
