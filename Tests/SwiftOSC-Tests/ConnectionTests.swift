//
//  ConnectionTests.swift
//  
//
//  Created by Fabian S. Klinke on 27.10.22.
//

import XCTest
import SwiftOSC

let adress = "localhost"
let port = 9000

final class ConnectionTests: XCTestCase {
    var client = OSCClient(address: adress, port: port)

    func testExample() throws {
        let message = OSCMessage(.init("/test"), "sent message \(Date().description)")
        client.send(message)
    }
}
