//
//  CNPJValidatorTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class CNPJValidatorTests: XCTestCase {
	
	private var validator: CNPJValidator!
	
	override func setUp() {
		super.setUp()
		
		validator = CNPJValidator()
	}
	
	override func tearDown() {
		validator = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let isEmpty = validator.validate(cnpj: "")
		
		expect(isEmpty).to(beFalse())
	}
	
	func test_shouldNotAccept_DifferentCharacters() {
		
		let differentCharacters = validator.validate(cnpj: "16.5a1.5c5/ooo1-57")
		
		expect(differentCharacters).to(beFalse())
	}
	
	func test_shouldNotAccept_LessCharactersThanAllowed() {
		
		let lessCharacters = validator.validate(cnpj: "1650155500157")
		
		expect(lessCharacters).to(beFalse())
	}
	
	func test_shouldNotAccept_MoreCharactersThanAllowed() {
		
		let moreCharacters = validator.validate(cnpj: "165015550001577")
		
		expect(moreCharacters).to(beFalse())
	}
	
	func test_shouldNotAccept_WrongFormat() {
		
		let wrongFormat = validator.validate(cnpj: "165.015.55/00015-7")
		
		expect(wrongFormat).to(beFalse())
	}
	
	func test_shouldAccept_FormattedCnpj() {
		
		let formattedCnpj = validator.validate(cnpj: "16.501.555/0001-57")
		
		expect(formattedCnpj).to(beTrue())
	}
	
	func test_shouldAccept_OnlyNumbersCnpj() {
		
		let simpleCnpj = validator.validate(cnpj: "16501555000157")
		
		expect(simpleCnpj).to(beTrue())
	}
}
