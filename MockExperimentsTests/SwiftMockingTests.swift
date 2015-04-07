//
//  SwiftMockingTests.swift
//  MockExperiments
//
//  Created by dasdom on 06.04.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit
import XCTest
import MockExperiments

class SwiftMockingTests: XCTestCase {

  var viewController = SwiftViewController()
  
  func testExample() {
    
    let jsonData = NSJSONSerialization.dataWithJSONObject(["meta": ["code": 200], "data": ["username": "dasdom", "name": "Dpminik Hauser", "id": "1472"]], options: nil, error: nil)
    let urlResponse = NSHTTPURLResponse(URL: NSURL(string: "https://api.app.net/posts/stream/global")!, statusCode: 200, HTTPVersion: nil, headerFields: nil)
    
    MockSession.mockResponse = (jsonData, urlResponse: urlResponse, error: nil)
    viewController.MySession = MockSession.self
    
    XCTAssertTrue(viewController.user == nil, "")
    
    viewController.loadUser()
    
    XCTAssertEqual(viewController.user!.username, "dasdom", "")
  }
  
  
  class MockSession: NSURLSession {
    var completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?
    
    static var mockResponse: (data: NSData?, urlResponse: NSURLResponse?, error: NSError?) = (data: nil, urlResponse: nil, error: nil)
    
    override class func sharedSession() -> NSURLSession {
      return MockSession()
    }
    
    override func dataTaskWithURL(url: NSURL, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) -> NSURLSessionDataTask {
      self.completionHandler = completionHandler
      return MockTask(response: MockSession.mockResponse, completionHandler: completionHandler)
    }
    
    class MockTask: NSURLSessionDataTask {
      typealias Response = (data: NSData?, urlResponse: NSURLResponse?, error: NSError?)
      var mockResponse: Response
      let completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?
      
      init(response: Response, completionHandler: ((NSData!, NSURLResponse!, NSError!) -> Void)?) {
        self.mockResponse = response
        self.completionHandler = completionHandler
      }
      override func resume() {
        completionHandler!(mockResponse.data, mockResponse.urlResponse, mockResponse.error)
      }
    }
  }


}
