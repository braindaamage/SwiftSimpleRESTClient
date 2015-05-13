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

        var SSRC = SwiftSimpleRestClient(apiUrl: "http://10.0.1.9:3000/api/")
        
        SSRC.call("GET", route: "cursos") {
            (data, urlResponse, error) in
            var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
            println("dataString = \(dataString!)")
        }
        
        
//        SSRC.call("POST", route: "cursos", data: [
//                "name": "Test POST",
//                "teacher": "Yo",
//                "owner": "mydevice"
//            ]) {
//            (data, urlResponse, error) in
//            var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
//            println("dataString = \(dataString!)")
//        }
        
//        SSRC.call("GET", route: "cursos/5552c9c343d42a5e07000001") {
//                (data, urlResponse, error) in
//                var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
//                println("dataString = \(dataString!)")
//        }
        
//        SSRC.call("PUT", route: "cursos/5552c9c343d42a5e07000001", data: [
//                "teacher": "Mi profe"
//            ]) {
//            (data, urlResponse, error) in
//            var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
//            println("dataString = \(dataString!)")
//        }
        
//        SSRC.call("DELETE", route: "cursos/5552c9c343d42a5e07000001") {
//                (data, urlResponse, error) in
//                var dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
//                println("dataString = \(dataString!)")
//        }
    }

}
