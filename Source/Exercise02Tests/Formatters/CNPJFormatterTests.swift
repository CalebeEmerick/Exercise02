//
//  CNPJFormatterTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 26/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class CNPJFormatterTests: XCTestCase {
	
	private var formatter: CNPJFormatter!
	
	override func setUp() {
		super.setUp()
		
		formatter = CNPJFormatter()
	}
	
	override func tearDown() {
		formatter = nil
		
		super.tearDown()
	}
	
	func test_shouldReturn_EmptyString_When_EmptyCnpjIsUsed() {
		
		let cnpj = ""
		
		let formattedCNPJ = formatter.format(cnpj)
		
		expect(formattedCNPJ).to(equal(""))
	}
	
	func test_shouldReturn_EmptyString_When_InvalidCnpjIsUsed() {
		
		let cnpj = "165.o15.55/ooo15-7"
		
		let formattedCNPJ = formatter.format(cnpj)
		
		expect(formattedCNPJ).to(equal(""))
	}
	
	func test_shouldExpect_CorrectCnpjFormatted_When_OnlyNumbersAreUsed() {
		
		let cnpj = "16501555000157"
		
		let expectedFormattedCNPJ = "16.501.555/0001-57"
		
		let formattedCNPJ = formatter.format(cnpj)
		
		expect(expectedFormattedCNPJ).to(equal(formattedCNPJ))
	}
	
	func test_shouldExpect_CorrectCnpjFormatted_When_MaskedCnpjIsUsed() {
		
		let cnpj = "16.501.555/0001-57"
		
		let expectedFormattedCNPJ = "16.501.555/0001-57"
		
		let formattedCNPJ = formatter.format(cnpj)
		
		expect(expectedFormattedCNPJ).to(equal(formattedCNPJ))
	}
}
