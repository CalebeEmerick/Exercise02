//
//  PhoneFormatterTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class PhoneFormatterTests: XCTestCase {
	
	private var formatter: PhoneFormatter!
	
	override func setUp() {
		super.setUp()
		
		formatter = PhoneFormatter()
	}
	
	override func tearDown() {
		formatter = nil
		
		super.tearDown()
	}
	
	func test_shouldExpect_CorrectPhoneFormatted_When_OnlyNumbersAreUsed() {
		
		let phone = "21971697123"
		
		let expectedFormattedPhone = "(21) 97169 7123"
		
		let formattedPhone = formatter.format(phone)
		
		expect(expectedFormattedPhone).to(equal(formattedPhone))
	}
	
	func test_shouldExpect_CorrectPhoneFormatted_When_MaskedPhoneIsUsed() {
		
		let phone = "(21)971697123"
		
		let expectedFormattedPhone = "(21) 97169 7123"
		
		let formattedPhone = formatter.format(phone)
		
		expect(expectedFormattedPhone).to(equal(formattedPhone))
	}
	
	func test_shouldExpect_CorrectPhoneFormatted_When_MaskedPhoneWithSpaceIsUsed() {
		
		let phone = "(21) 971697123"
		
		let expectedFormattedPhone = "(21) 97169 7123"
		
		let formattedPhone = formatter.format(phone)
		
		expect(expectedFormattedPhone).to(equal(formattedPhone))
	}
}
