//
//  SwiftSimpleRestClient.swift
//  SwiftSimpleRESTClient
//
//  Created by Leonardo Olivares on 06-05-15.
//  Copyright (c) 2015 LAOU. All rights reserved.
//

import Foundation

class SwiftSimpleRestClient {
    private var url : String = ""
    private let baseUrl : String
    private let request : NSMutableURLRequest = NSMutableURLRequest()
    private let session: NSURLSession = NSURLSession.sharedSession()
    
    init(var apiUrl: String) {
        let endIndex = advance(apiUrl.endIndex, -1)
        if (apiUrl[endIndex] != "/") {
            apiUrl = "\(apiUrl)/"
        }
        baseUrl = apiUrl
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
    
    func call(method: String, route: String, data: String?, callback: (NSData!, NSURLResponse!, NSError!) -> Void) -> Void {
        request.HTTPMethod = method
        request.URL = NSURL(string: baseUrl + route)
        
        var task = session.dataTaskWithRequest(request) {
            (data, urlResponse, error) in
            dispatch_async(dispatch_get_main_queue(), {
                () -> Void in
                callback(data, urlResponse, error)
            })
        }
        
        task.resume()
    }
}