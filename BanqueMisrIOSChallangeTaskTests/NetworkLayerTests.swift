//
//  NetworkLayerTests.swift
//  BanqueMisrIOSChallangeTaskTests
//
//  Created by Mohamed Elzohirey on 18/02/2022.
//

import XCTest
@testable import BanqueMisrIOSChallangeTask
class NetworkLayerTests: XCTestCase {
    var networkLayer: NetworkLayer!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
         networkLayer = NetworkLayer(session: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkLayer = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func test_GetRequest_ReturnFailureWhenErrorReturnFromServer() throws {

        // Arrange
        let exp = expectation(description: "wait unitil mock server response")
        let responseJsonStr = ResponsesSample.badRequest.rawValue
        MockURLProtocol.stubResponseData = responseJsonStr.data(using: .utf8)
        MockURLProtocol.httpUrlResponse = HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 400, httpVersion: nil, headerFields: nil)
        // Act
        networkLayer.getRequest(model: AllMakesResponse.self, RequestConfiq: NetworkRouter.GetAllMakes(1)) {
            response in
            switch response {
            case .success:

                 break
            case .failier(let error):
                // Assert
                XCTAssertNotNil(error)
                XCTAssertEqual(error.type, ErrorType.serverError)
                exp.fulfill()
                break
            }
        }

        wait(for: [exp], timeout: 5)
    }

    func test_GetRequest_ReturnFailureWhenUnknownErrorReturnFromServer() throws {

        // Arrange
        let exp = expectation(description: "wait unitil mock server response")
        let responseJsonStr = ""
        MockURLProtocol.stubResponseData = responseJsonStr.data(using: .utf8)
        MockURLProtocol.httpUrlResponse = HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 400, httpVersion: nil, headerFields: nil)
        // Act
        networkLayer.getRequest(model: AllMakesResponse.self, RequestConfiq: NetworkRouter.GetAllMakes(1)) {
            response in
            switch response {
            case .success:

                 break
            case .failier(let error):
                // Assert
                XCTAssertNotNil(error)
                XCTAssertEqual(error.message, ErrorMessage.unknownError.rawValue)
                exp.fulfill()
                break
            }
        }

        wait(for: [exp], timeout: 5)
    }
    func test_GetRequest_ReturnFailureWhenConnectionErrorHappened() throws {

        // Arrange
        let exp = expectation(description: "wait unitil mock server response")
        let error = BanqueMisrError(message: "connection error", type: ErrorType.connectionError)
        MockURLProtocol.error = error

        // Act
        networkLayer.getRequest(model: AllMakesResponse.self, RequestConfiq: NetworkRouter.GetAllMakes(1)) {
            response in
            switch response {
            case .success:

                 break
            case .failier(let error):
                // Assert
                XCTAssertNotNil(error)
                XCTAssertEqual(error.type, ErrorType.ConnectionError)
                exp.fulfill()
                break
            }
        }

        wait(for: [exp], timeout: 5)
    }
    func test_GetRequest_ReturnFailureWhenCantSerilizeResponse() throws {

        // Arrange
        let exp = expectation(description: "wait unitil mock server response")
        let responseJsonStr = ""
        MockURLProtocol.stubResponseData = responseJsonStr.data(using: .utf8)
        MockURLProtocol.httpUrlResponse = HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        // Act
        networkLayer.getRequest(model: AllMakesResponse.self, RequestConfiq: NetworkRouter.GetAllMakes(1)) {
            response in
            switch response {
            case .success:

                 break
            case .failier(let error):
                // Assert
                XCTAssertNotNil(error)
                XCTAssertEqual(error.type, ErrorType.serializationError)
                exp.fulfill()
                break
            }
        }

        wait(for: [exp], timeout: 5)
    }
    func test_GetRequest_ReturnSuccessWhenServerReturnValidResponse() throws {

        // Arrange
        let exp = expectation(description: "wait unitil mock server response")
        let responseJsonStr = ResponsesSample.allMakesResponse.rawValue
        MockURLProtocol.stubResponseData = responseJsonStr.data(using: .utf8)
        MockURLProtocol.httpUrlResponse = HTTPURLResponse(url: URL(string: "www.test.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        // Act
        networkLayer.getRequest(model: AllMakesResponse.self, RequestConfiq: NetworkRouter.GetAllMakes(1)) {
            response in
            switch response {
            case .success(let response):
                // Assert
                XCTAssertNotNil(response)
                exp.fulfill()
                 break
            case .failier:

                break
            }
        }

        wait(for: [exp], timeout: 5)
    }
}
