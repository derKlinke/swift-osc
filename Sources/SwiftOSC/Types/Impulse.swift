//
//  OSCTypes.swift
//  SwiftOSC
//
//  Created by Devin Roth on 6/26/16.
//  Copyright © 2016 Devin Roth Music. All rights reserved.
//

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
