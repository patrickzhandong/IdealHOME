//
//  IdealHOMETests.swift
//  IdealHOMETests
//
//  Created by Zhan Dong on 3/5/17.
//  Copyright © 2017 Zhan Dong. All rights reserved.
//

import XCTest
@testable import IdealHOME

class IdealHOMETests: XCTestCase {
    //MARK: Meal Class Tests
    func testFurInitializationSucceeds() {
        let zeroRatingMeal = Furniture.init(name: "Zero", photo: nil, fursize: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Furniture.init(name: "Positive", photo: nil, fursize: 5)
        XCTAssertNotNil(positiveRatingMeal)
        
    }
    func testMealInitializationFails() {
        let negativeRatingMeal = Furniture.init(name: "Negative", photo: nil, fursize: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Furniture.init(name: "", photo: nil, fursize: 0)
        XCTAssertNil(emptyStringMeal)
        
    }
    
}
