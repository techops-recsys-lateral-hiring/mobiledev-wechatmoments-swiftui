//
//  TweetModelTests.swift
//  WeChatMomentsTests
//

@testable import WeChatMoments
import Combine
import XCTest

class TweetServiceTests: XCTestCase {
    private var tweetService: TweetService!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        self.tweetService = TweetService()
    }

    override class func tearDown() {
    }

    func testRightURL() {
        let readyExpectation = expectation(description: "ready")

        self.tweetService.getTweets(TestDataConfig.USER).sink { completion in
            switch completion{
            case .finished:
                readyExpectation.fulfill()
            case .failure:
                XCTAssertThrowsError("request failed,error happen")
            }
        } receiveValue: { tweets in
            if tweets.count == 0 {
                XCTAssertTrue(false, "The tweets should be not nil")
            }
        }.store(in: &cancellables)

        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
    }

    func testWrongURL() {
        let readyExpectation = expectation(description: "ready")
        tweetService.getTweets("jsmitn2").sink { completion in
            switch completion{
            case .finished:
                readyExpectation.fulfill()
            case .failure:
                XCTAssertThrowsError("request failed,error happen")
            }
        } receiveValue: { tweets in
            let numberOfTweets = tweets.count
            if numberOfTweets > 0 {
                XCTAssertTrue(false, "There should be not tweet")
            }
        }.store(in: &cancellables)
        
        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
    }
}
