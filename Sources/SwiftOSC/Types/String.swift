// -----------------------------------------------------------------------------------------------------------
// String.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

extension String: OSCType {
    public var tag: String {
        "s"
    }

    public var data: Data {
        var data = self.data(using: String.Encoding.utf8)!

        // base 32 null terminated data
        for _ in 1 ... 4 - data.count % 4 {
            var null = UInt8(0)
            data.append(&null, count: 1)
        }

        return data
    }

    init(_ data: Data) {
        self = String(data: data, encoding: String.Encoding.utf8)!
    }
}
