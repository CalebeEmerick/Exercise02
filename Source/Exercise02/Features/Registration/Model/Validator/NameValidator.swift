//
//  NameValidator.swift
//  Exercise02
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class NameValidator {
	
	func validate(text: String) -> Bool {
		
		guard !text.isEmpty else {
			return false
		}
		
		guard hasOnlyLetters(name: text) else {
			return false
		}
		
		let names = getArrayOfNames(for: text)
		
		guard hasNameAndLastName(for: names) else {
			return false
		}
		
		let fullName = getNameAndLastName(for: names)
		
		let conditions: [Bool] = [
			hasLessCharactersThanAllowed(for: text),
			hasMoreCharactersThanAllowed(for: text),
			hasMinimunCharacter(for: fullName.name),
			hasMiddleNameValid(middleName: fullName.middleName),
			hasMinimunCharacter(for: fullName.lastName)
		]
		
		guard !conditions.contains(false) else {
			return false
		}
		
		return true
	}
	
	private func hasLessCharactersThanAllowed(for text: String) -> Bool {
		return text.count >= 5
	}
	
	private func hasMoreCharactersThanAllowed(for text: String) -> Bool {
		return text.count <= 61
	}
	
	private func getArrayOfNames(for text: String) -> [String] {
		return text.split(separator: " ").map { String($0) }
	}
	
	private func hasNameAndLastName(for names: [String]) -> Bool {
		return names.count == 2 || names.count == 3
	}
	
	private func getNameAndLastName(for names: [String]) -> FullName {
		return FullName(names: names)
	}
	
	private func hasMinimunCharacter(for name: String) -> Bool {
		return name.count > 1
	}
	
	private func hasMiddleNameValid(middleName: String?) -> Bool {
		if let middleName = middleName {
			return middleName.count > 1 && middleName.count < 4
		}
		return true
	}
	
	private func trimSpaces(for text: String) -> String {
		let trimmedText = text.replacingOccurrences(of: " ", with: "")
		return trimmedText
	}
	
	private func hasOnlyLetters(name: String) -> Bool {
		let trimmedName = trimSpaces(for: name)
		let nameCharacters = CharacterSet(charactersIn: trimmedName)
		return CharacterSet.letters.isSuperset(of: nameCharacters)
	}
	
	private struct FullName {
		
		let name: String
		let middleName: String?
		let lastName: String
		
		init(names: [String]) {
			if names.count == 2 {
				name = names[0]
				lastName = names[1]
				middleName = nil
			}
			else if names.count == 3 {
				name = names[0]
				middleName = names[1]
				lastName = names[2]
			}
			else {
				fatalError("Passou um array de nomes com apenas 1 nome ou mais de 3 nomes.")
			}
		}
		
		var combinedName: String {
			if let middleName = middleName {
				return "\(name) \(middleName) \(lastName)"
			}
			return "\(name) \(lastName)"
		}
	}
}
