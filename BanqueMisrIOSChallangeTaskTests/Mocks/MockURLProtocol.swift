//
//  MockURLProtocol.swift
//  TutorialTests
//
//  Created by Mohamed Elzohirey on 12/01/2022.
//

import Foundation
class MockURLProtocol : URLProtocol
{
    static var stubResponseData : Data?
    static var error : Error?
    static var httpUrlResponse : HTTPURLResponse?
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override func startLoading() {
        if let response = MockURLProtocol.httpUrlResponse
        {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)

        }

        if let requestError = MockURLProtocol.error
        {
            self.client?.urlProtocol(self, didFailWithError: requestError)
        }
        else
        {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    override func stopLoading() {
        
    }
}
