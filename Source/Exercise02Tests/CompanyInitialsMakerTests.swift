//
//  CompanyInitialsMakerTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 10/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import XCTest
import Nimble

final class CompanyInitialsMakerTests: XCTestCase {
	
	private var initialsMaker: CompanyInitialsMaker!
	
	override func setUp() {
		super.setUp()
		
		initialsMaker = CompanyInitialsMaker()
	}
	
	override func tearDown() {
		initialsMaker = nil
		
		super.tearDown()
	}
	
	func test_shouldReturnNAWhen_CompanyNameIsInvalid() {
		
		let initials = initialsMaker.makeFor(company: "3 546. 787.")
		
		expect(initials) == initialsMaker.notPossibleMakeInitials
	}
	
	func test_shouldNotAccept_EmptyName() {
		
		let initials = initialsMaker.makeFor(company: "")
		
		expect(initials) == initialsMaker.notPossibleMakeInitials
	}
	
	func test_shouldReturnTwoFirstCharactersWhen_CompanyNameHasOnlyOneName() {
		
		let initials = initialsMaker.makeFor(company: "Amazon")
		
		expect(initials) == "AM"
	}
	
	func test_shouldReturnThreeFirstCharactersWhen_CompanyNameHasThreeNames() {
		
		let initials = initialsMaker.makeFor(company: "Apple Google Amazon")
		
		expect(initials) == "AGA"
	}
}
