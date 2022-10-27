// -----------------------------------------------------------------------------------------------------------
// OSCTypeProtocol.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

/// A protocol for all the OSC types. The types are: Blob, Bool, Float, Impluse, Int, String, Timetag
public protocol OSCType {
    var tag: String { get }
    var data: Data { get }
}
