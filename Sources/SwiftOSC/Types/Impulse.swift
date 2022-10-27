// -----------------------------------------------------------------------------------------------------------
// Impulse.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

// MARK: - Impulse
public struct Impulse {
    public init() {}
}

// MARK: Impulse + OSCType
extension Impulse: OSCType {
    public var tag: String {
        "I"
    }

    public var data: Data {
        Data()
    }
}

public let impulse = Impulse()
