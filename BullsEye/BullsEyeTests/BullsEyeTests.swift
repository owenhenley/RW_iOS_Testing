/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest

// This gives the unit tests access to the internal types and functions in BullsEye.
@testable import BullsEye

class BullsEyeTests: XCTestCase {

    var sut: BullsEyeGame! // sut = System Under Test

    override func setUp() {
        super.setUp()
        // This creates a BullsEyeGame object at the class level, so all the tests in this test class can access the SUT object’s properties and methods.
        sut = BullsEyeGame()
        sut.startNewGame()
    }

    override func tearDown() {
        // Release your SUT object
        sut = nil
        super.tearDown()
    }
}

// MARK: - Tests
extension BullsEyeTests {
    func testScoreIsComputed() {
        // Given
        // Set up any values needed
        let guess = sut.targetValue + 5

        // When
        // Execute the code being tested
        sut.check(guess: guess)

        // Then
        // Assert the result you expect with a message that prints if the test fails
        XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
    }

    func testScoreIsComputedWhaenGuessLTTarget() {
        // Given
        let guess = sut.targetValue - 5

        // When
        sut.check(guess: guess)

        // Then
        XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
    }
}
