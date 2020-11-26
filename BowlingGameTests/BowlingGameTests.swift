//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by alexis on 20/11/20.
//

import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {
    
    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }

    func testGutterGame(){
        rollMany(pins: 0, times: 20)
        XCTAssertEqual(game.score(), 0)
    }
    
    func testaGameWithAllOnes() {
        rollMany(pins: 1, times: 20)

        XCTAssertEqual(game.score(), 20)
    }
    
    func testOneSpare() {
        game.roll(0)
        game.roll(10)
        game.roll(3)
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        game.roll(10)
        game.roll(3)
        game.roll(4)
        XCTAssertEqual(game.score(), 24)
    }
    
    func testPerfectGame() {
        rollMany(pins: 10, times: 12)
        XCTAssertEqual(game.score(), 300)
    }
    
    private func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
}
