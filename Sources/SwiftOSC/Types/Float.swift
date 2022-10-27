// -----------------------------------------------------------------------------------------------------------
// Float.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

// MARK: - Float + OSCType
extension Float: OSCType {
    public var tag: String {
        "f"
    }

    public var data: Data {
        var float = CFConvertFloat32HostToSwapped(Float32(self))
        let buffer = withUnsafeMutablePointer(to: &float) { UnsafeBufferPointer(start: $0, count: 1) }
        return Data(buffer: buffer)
    }

    init(_ data: Data) {
        var float = CFConvertFloat32HostToSwapped(Float())
        let buffer = withUnsafeMutablePointer(to: &float) { UnsafeMutableBufferPointer(start: $0, count: 1) }
        _ = data.copyBytes(to: buffer)
        self = Float(CFConvertFloat32SwappedToHost(float))
    }
}

// MARK: - Double + OSCType
// convert double to float for ease of access
extension Double: OSCType {
    public var tag: String {
        "f"
    }

    public var data: Data {
        var float = CFConvertFloat32HostToSwapped(Float32(self))
        let buffer = withUnsafeMutablePointer(to: &float) { UnsafeBufferPointer(start: $0, count: 1) }
        return Data(buffer: buffer)
    }
}
