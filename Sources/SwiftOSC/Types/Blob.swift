// -----------------------------------------------------------------------------------------------------------
// Blob.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

public typealias Blob = Data

// MARK: Blob + OSCType
extension Blob: OSCType {
    public var tag: String {
        "b"
    }

    public var data: Data {
        let length = UInt32(count)
        var data = Data()

        data.append(length.toData())

        data.append(self)

        // base 32
        while data.count % 4 != 0 {
            var null = UInt8(0)
            data.append(&null, count: 1)
        }

        return data
    }

    init(_ data: Data) {
        self = data
    }
}
