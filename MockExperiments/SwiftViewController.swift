//
//  SwiftViewController.swift
//  MockExperiments
//
//  Created by dasdom on 06.04.15.
//  Copyright (c) 2015 Dominik Hauser. All rights reserved.
//

import UIKit

public class SwiftViewController: UIViewController {

  public var MySession = NSURLSession.self
  public var user: User?
  
  public func loadUser() {
    let url = NSURL(string: "https://api.app.net/users/@dasdom")
    let session = MySession.sharedSession()
    
    println("MySession: \(MySession)")
    
    let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
      let dataDict = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! [String:AnyObject]
      
      let userDict = dataDict["data"] as! [String:AnyObject]
      
      self.user = User(username: userDict["username"] as! String, name: userDict["name"] as! String, id: userDict["id"] as! String)
      
    })
    task.resume()
  }
}
