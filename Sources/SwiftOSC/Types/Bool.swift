// -----------------------------------------------------------------------------------------------------------
// Bool.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

extension Bool: OSCType {
    public var tag: String {
        if self == true {
            return "T"
        } else {
            return "F"
        }
    }

    public var data: Data {
        Data()
    }
}
