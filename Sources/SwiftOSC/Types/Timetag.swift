//
//  OSCTypes.swift
//  SwiftOSC
//
//  Created by Devin Roth on 6/26/16.
//  Copyright © 2016 Devin Roth Music. All rights reserved.
//

import Foundation

public typealias Timetag = UInt64

// MARK: Timetag + OSCType
extension Timetag: OSCType {
    public var tag: String {
        "t"
    }

    public var data: Data {
        var int = bigEndian
        let buffer = withUnsafeMutablePointer(to: &int) { UnsafeBufferPointer(start: $0, count: 1) }
        return Data(buffer: buffer)
    }

    public var secondsSince1900: Double {
        Double(self / 0x100000000)
    }

    public var secondsSinceNow: Double {
        if self > 0 {
            return Double((self - Date().oscTimetag) / 0x100000000)
        } else {
            return 0.0
        }
    }

    public init(secondsSinceNow seconds: Double) {
        self = Date().oscTimetag
        self += UInt64(seconds * 0x100000000)
    }

    public init(secondsSince1900 seconds: Double) {
        self = UInt64(seconds * 0x100000000)
    }

    init(_ data: Data) {
        var int = UInt64()
        let buffer = withUnsafeMutablePointer(to: &int) { UnsafeMutableBufferPointer(start: $0, count: 1) }
        _ = data.copyBytes(to: buffer)

        self = int.byteSwapped
    }
}
