//
//  HttpServiceTests.swift
//  WeChatMomentsTests
//

@testable import WeChatMoments
import Combine
import XCTest

class HttpServiceTests: XCTestCase {
    private var service: HttpService!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        service = HttpService()
    }
    
    override class func tearDown() {}
    
    func test_get_success() {
        let readyExpectation = expectation(description: "ready")
        let url = URL(string: TestDataConfig.URL_HOST)!

        service.get(url: url).sink { completion in
            switch completion{
            case .finished:
                readyExpectation.fulfill()
            case .failure:
                XCTAssertThrowsError("request failed,error happen")
            }
        } receiveValue: { jsonString in
            XCTAssertNotNil(jsonString, "Request should  success.")
        }.store(in: &cancellables)

        waitForExpectations(timeout: 10) { error in
            XCTAssertNil(error, "Error should not happen.")
        }
    }
}
