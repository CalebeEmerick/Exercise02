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
	
	func test_shouldNotAccept_OtherCharactersThanNumber() {
		
		let invalidCharacters = validator.validate(phone: "2198762a459")
		
		expect(invalidCharacters).to(beFalse())
	}
	
	func test_shouldNotAccept_TwoPlusCharacters() {
		
		let invalidPhone = validator.validate(phone: "++55971697123")
		
		expect(invalidPhone).to(beFalse())
	}
	
	func test_shouldAccept_FullPhoneNumber() {
		
		let validPhone = validator.validate(phone: "+5521971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_FullPhoneNumber_WithoutPlusCharacter() {
		
		let validPhone = validator.validate(phone: "+5521971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_DDDAndPhoneNumber() {
		
		let validPhone = validator.validate(phone: "21971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_JustPhoneNumber() {
		
		let validPhone = validator.validate(phone: "971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_SpacedFullPhoneNumber() {
		
		let validPhone = validator.validate(phone: "+55 21 971697123")
		
		expect(validPhone).to(beTrue())
	}
	
	func test_shouldAccept_SpacedDDDAndPhoneNumber() {
		
		let validPhone = validator.validate(phone: "21 971697123")
		
		expect(validPhone).to(beTrue())
	}
}
