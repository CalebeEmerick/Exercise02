//
//  PhoneValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 20/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class PhoneValidatorTests: XCTestCase {
	
	private var validator: PhoneValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = PhoneValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let isEmpty = validator.validate(phone: "")
		
		expect(isEmpty).to(beFalse())
	}
	
	func test_shouldNotAccept_LessCharacter_ThanAllowed() {
		
		let lessCharacters = validator.validate(phone: "2197169712")
		
		expect(lessCharacters).to(beFalse())
	}
	
	func test_shouldNotAccept_MoreCharacter_ThanAllowed() {
		
		let moreCharacters = validator.validate(phone: "219716971233")
		
		expect(moreCharacters).to(beFalse())
	}
	
	func test_shouldNotAccept_OtherCharactersThanNumber() {
		
		let invalidCharacters = validator.validate(phone: "2198762a459")
		
		expect(invalidCharacters).to(beFalse())
	}
	
	func test_shouldAccept_DDDAndPhoneNumber() {
		
		let validPhone = validator.validate(phone: "21971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_SpacedDDDAndPhoneNumber() {
		
		let validPhone = validator.validate(phone: "21 971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_DDDBetweenParentheses() {
		
		let validPhone = validator.validate(phone: "(21)971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_DDDBetweenParenthesesAndSpace() {
		
		let validPhone = validator.validate(phone: "(21) 971697123")
		
		expect(validPhone).to(beTrue())
	}
}
