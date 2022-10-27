// -----------------------------------------------------------------------------------------------------------
// ConnectionTests.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import SwiftOSC
import XCTest

let adress = "localhost"
let port = 9_000

// MARK: - ConnectionTests
final class ConnectionTests: XCTestCase {
    var client = OSCClient(address: adress, port: port)

    func testExample() throws {
        let message = OSCMessage(.init("/test"), "sent message \(Date().description)")
        client.send(message)
    }
}
