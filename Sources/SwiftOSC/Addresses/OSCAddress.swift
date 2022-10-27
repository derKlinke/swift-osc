// -----------------------------------------------------------------------------------------------------------
// OSCAddress.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

/// The address of the message.
///
/// *This struct validates the OSC address you pass into it. Invalid characters are: space * , ? [ ] { } OR
/// two or more / in a row AND must start with / AND no empty strings*
public struct OSCAddress {
    // MARK: Properties
    public var string: String {
        didSet {
            if !valid(string) {
                NSLog("\"\(string)\" is an invalid address")
                string = oldValue
            }
        }
    }

    // MARK: initializers
    public init() {
        string = "/"
    }

    public init(_ address: String) {
        string = "/"
        if valid(address) {
            string = address
        } else {
            NSLog("\"\(address)\" is an invalid address")
        }
    }

    // MARK: methods
    func valid(_ address: String) -> Bool {
        var isValid = true

        autoreleasepool {
            // invalid characters: space * , ? [ ] { } OR two or more / in a row AND must start with / AND no
            // empty strings
            if address
                .range(of: "[\\s\\*,?\\[\\]\\{\\}]|/{2,}|^[^/]|^$", options: .regularExpression) != nil {
                // returns false if there are any matches
                isValid = false
            }
        }

        return isValid
    }
}
