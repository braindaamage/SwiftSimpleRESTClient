//
//  SwiftSimpleRestClient.swift
//  SwiftSimpleRESTClient
//
//  Created by Leonardo Olivares on 06-05-15.
//  Copyright (c) 2015 LAOU. All rights reserved.
//

import Foundation

class SwiftSimpleRestClient {
    var url : String = ""
    let baseUrl : String
    let request : NSMutableURLRequest = NSMutableURLRequest()
    let session: NSURLSession = NSURLSession.sharedSession()
    
    init(var apiUrl: String) {
        let endIndex = advance(apiUrl.endIndex, -1)
        if (apiUrl[endIndex] != "/") {
            apiUrl = "\(apiUrl)/"
        }
        self.baseUrl = apiUrl
        self.request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
    
    func GET(var route: String, callback: (NSData!, NSURLResponse!, NSError!) -> Void) -> Void {
        request.HTTPMethod = "GET"
        self.url = self.baseUrl + route
        self.call(callback)
    }
    
    func call(callback: (NSData!, NSURLResponse!, NSError!) -> Void) -> Void {
        self.request.URL = NSURL(string: self.url)
        
        var task = self.session.dataTaskWithRequest(self.request) {
            (data, urlResponse, error) in
            dispatch_async(dispatch_get_main_queue(), {
                () -> Void in
                callback(data, urlResponse, error)
            })
        }
        
        task.resume()
    }
}