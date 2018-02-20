//
//  NameValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class NameValidatorTests: XCTestCase {
	
	private var validator: NameValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = NameValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let isEmpty = validator.validate(text: "")
		
		expect(isEmpty).to(beFalse())
	}
	
	func test_shouldNotAccept_MoreCharacterThanAllowed() {
		
		let tooLongName = validator.validate(text: "Nameasodsaosokpsopksadokdpsa LastNameopposadkpakodkapdkpasdkpsodkposakdpaskdspdpk")
		
		expect(tooLongName).to(beFalse())
	}
	
	func test_shouldNotAccept_LessCharacterThanAllowed() {
		
		let tooShortName = validator.validate(text: "Na m")
		
		expect(tooShortName).to(beFalse())
	}
	
	func test_shouldNotAccept_FirstName_WithLessThanTwoCharacters() {
		
		let invalidFirstName = validator.validate(text: "T LastName")
		
		expect(invalidFirstName).to(beFalse())
	}
	
	func test_shouldNotAccept_LastName_WithLessThanTwoCharacters() {
		
		let invalidLastName = validator.validate(text: "Name O")
		
		expect(invalidLastName).to(beFalse())
	}
	
	func test_shouldNotAccept_FirstName_WithoutLastName() {
		
		let invalidLastName = validator.validate(text: "Name ")
		
		expect(invalidLastName).to(beFalse())
	}
	
	func test_shouldNotAccept_Lastname_WithoutFirstName() {
		
		let invalidFirstName = validator.validate(text: " LastName")
		
		expect(invalidFirstName).to(beFalse())
	}
	
	func test_shouldNotAccept_MiddleName_HasMoreThanThreeCharacters() {
		
		let invalidMiddleName = validator.validate(text: "Name LongMiddleName LastName")
		
		expect(invalidMiddleName).to(beFalse())
	}
	
	func test_shouldNotAcceptMiddleName_HasLessThanTwoCharacters() {
		
		let invalidMiddleName = validator.validate(text: "Name C LastName")
		
		expect(invalidMiddleName).to(beFalse())
	}
	
	func test_shouldNotAccept_DotsCharacters() {
		
		let invalidName = validator.validate(text: "Name ... LastName")
		
		expect(invalidName).to(beFalse())
	}
	
	func test_shouldNotAccept_InvalidCharacters() {
		
		let invalidName = validator.validate(text: "#Name *LastName*")
		
		expect(invalidName).to(beFalse())
	}
	
	func test_shouldOnlyAccept_LettersAndWhiteSpace() {
		
		let invalidName = validator.validate(text: "Name-LastName")
		
		expect(invalidName).to(beFalse())
	}
	
	func test_shouldAccept_NameAndLastName() {
		
		let validName = validator.validate(text: "Name LastName")
		
		expect(validName).to(beTrue())
	}
	
	func test_shouldAccept_NameMiddleNameAndLastName() {
		
		let validName = validator.validate(text: "Name And LastName")
		
		expect(validName).to(beTrue())
	}
}
