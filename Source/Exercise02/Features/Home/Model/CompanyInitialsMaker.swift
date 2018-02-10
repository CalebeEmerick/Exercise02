//
//  CompanyInitialsMaker.swift
//  Exercise02
//
//  Created by Calebe Emerick on 10/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class CompanyInitialsMaker {
	
	let notPossibleMakeInitials = "N/A"
	
	func makeFor(company name: String) -> String {
		
		guard !name.isEmpty else {
			return notPossibleMakeInitials
		}
		
		let separatedNames = getSeparatedNames(from: name)
		
		let initials = getCompanyInitials(from: separatedNames)
		
		if initials.isEmpty {
			return notPossibleMakeInitials
		}
		
		return initials
	}
	
	private func getSeparatedNames(from name: String) -> [String] {
		let splitedSubstring = name.split(separator: " ")
		return splitedSubstring.map { String($0) }
	}
	
	private func getCompanyInitials(from names: [String]) -> String {
		let onlyOneName = names.count == 1
		var initials = ""
		for (index, name) in names.enumerated() where index < 3 {
			initials += getValidCharacter(from: name, onlyOneName: onlyOneName)
		}
		return initials
	}
	
	private func getValidCharacter(from name: String, onlyOneName: Bool) -> String {
		var capitalizedCharacter = ""
		let numberOfRepetitions = onlyOneName ? 1 : 0
		
		for (index, character) in name.enumerated() where index <= numberOfRepetitions {
			let result = isCharacterValid(character: character)
			
			if result.isValid {
				capitalizedCharacter += result.character
			}
		}
		
		return capitalizedCharacter
	}
	
	private func isCharacterValid(character: Character) -> (isValid: Bool, character: String) {
		let characterString = String(character)
		let charSet = CharacterSet(charactersIn: characterString)
		
		if CharacterSet.letters.isSuperset(of: charSet) {
			return (isValid: true, character: characterString.capitalized)
		}
		else {
			return (isValid: false, character: "")
		}
	}
}
