//
//  ExampleViewController.swift
//  SwiftSimpleRESTClient
//
//  Created by Leonardo Olivares on 06-05-15.
//  Copyright (c) 2015 LAOU. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var SSRC = SwiftSimpleRestClient(apiUrl: "http://10.0.1.22:3000/api/")
        SSRC.GET("users") {
            (data, urlResponse, error) in
            var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
            println("dataString = \(dataString!)")
        }
    }

}
