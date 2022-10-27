// -----------------------------------------------------------------------------------------------------------
// OSCElementProtocol.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

/// Protocol for all OSC types that are sent/received. OSCMessage and OSCBundle conform to this protocol
public protocol OSCElement {
    var data: Data { get }
}
