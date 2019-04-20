//
//  APICallTest.swift
//  TestProjectTests
//
//  Created by MAC on 4/20/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import XCTest
@testable import TestProject

class APICallTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

   
    
    func testGetCategoriesList() {
        
        let expectation = self.expectation(description: "categories received successfully")
        DataService().fetchData(with: ApiNames.categories.rawValue) { (response, error) in
            if(response != nil && response!.count > 0)
            {
                
               expectation.fulfill()
                return;
            }
             XCTFail()
        }
        waitForExpectations(timeout: 3.0) { (error) in
            
        }
    }
    
    func testGetRestaurantsList() {
        
        let expectation = self.expectation(description: "restaurants received successfully")
        DataService().fetchData(with: ApiNames.restaurants.rawValue) { (response, error) in
            if(response != nil && response!.count > 0)
            {
                
                expectation.fulfill()
                return;
            }
            XCTFail()
        }
        waitForExpectations(timeout: 3.0) { (error) in
            
        }
    }
    
    
    func testGetVacationSpot() {
        
        let expectation = self.expectation(description: "vacation spot received successfully")
        DataService().fetchData(with: ApiNames.restaurants.rawValue) { (response, error) in
            if(response != nil && response!.count > 0)
            {
                
                expectation.fulfill()
                return;
            }
            XCTFail()
        }
        waitForExpectations(timeout: 3.0) { (error) in
            
        }
    }

}
