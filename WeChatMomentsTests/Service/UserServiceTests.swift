//
//  UserServiceTests.swift
//  WeChatMomentsTests
//

@testable import WeChatMoments
import Combine
import XCTest

class UserServiceTests: XCTestCase {
    private var userService: UserService!
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        self.userService = UserService()
    }

    override class func tearDown() {
    }

    func test_right_url() {
        let readyExpectation = expectation(description: "ready")

        self.userService.getUserProfile(TestDataConfig.USER).sink { completion in
            switch completion{
            case .finished:
                readyExpectation.fulfill()
            case .failure:
                XCTAssertThrowsError("request failed,error happen")
            }
        } receiveValue: { user in
               if let username = user.username {
                XCTAssertEqual(TestDataConfig.USER, username, "User should be jsmith.(\(username))")
            } else {
                XCTAssertTrue(false, "User should be jsmith.")
            }
        }.store(in: &cancellables)

        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
    }

    func test_wrong_url() {
        let readyExpectation = expectation(description: "ready")

        self.userService.getUserProfile("jsmitn2").sink { completion in
            switch completion{
            case .finished:
                readyExpectation.fulfill()
            case .failure:
                XCTAssertThrowsError("request failed,error happen")
            }
        } receiveValue: { user in
            XCTAssertNil(user.username, "UserName should be nil.")
            XCTAssertNil(user.avatar, "User avatar should be nil.")
            XCTAssertNil(user.nick, "User nick name should be nil.")
            XCTAssertNil(user.profile, "User profile should be nil.")
        }.store(in: &cancellables)

        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
    }
}
