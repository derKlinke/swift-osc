// -----------------------------------------------------------------------------------------------------------
// Int.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

extension Int: OSCType {
    public var tag: String {
        "i"
    }

    public var data: Data {
        var int = Int32(self).bigEndian
        let buffer = withUnsafeMutablePointer(to: &int) { UnsafeBufferPointer(start: $0, count: 1) }
        let data = Data(buffer: buffer)
        return data
    }

    init(_ data: Data) {
        var int = Int32()
        let buffer = withUnsafeMutablePointer(to: &int) { UnsafeMutableBufferPointer(start: $0, count: 1) }
        _ = data.copyBytes(to: buffer)

        self = Int(int.byteSwapped)
    }
}
