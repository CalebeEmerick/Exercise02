//
//  HeadlinesTests.swift
//  Exercise02Tests
//
//  Created by Calebe Emerick on 21/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise02
import Nimble
import XCTest

final class HeadlinesTests: XCTestCase {
	
	private var fetcher: RetrieveHeadlines!
	
	override func setUp() {
		super.setUp()
		
		fetcher = RetrieveHeadlinesMock()
	}
	
	override func tearDown() {
		fetcher = nil
		
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyHeadlines() {
		
		let headlineList = fetcher.fetch()
		
		expect(headlineList).toNot(beEmpty())
	}
	
	func test_shouldHave_AllRegistrationFields() {
		
		let headlines = fetcher.fetch()
		
		expect(headlines.count).to(equal(7))
	}
}
