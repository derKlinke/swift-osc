// -----------------------------------------------------------------------------------------------------------
// OSCBundle.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

/// Used to group two or more OSCElements. In most cases, you can bundle two or more OSCMessages to be sent at
/// the same time.
public class OSCBundle: OSCElement, CustomStringConvertible {
    // MARK: Properties

    public var timetag: Timetag
    /// An array of OSCElements that is or will be grouped in the bundle.
    public var elements: [OSCElement] = []
    /// The whole OSC message in Data form. This has the all the elements in a single Data type.
    public var data: Data {
        var data = Data()
        // add "#bundle" tag
        data.append("#bundle".toDataBase32())

        // add timetag
        data.append(timetag.data)

        // add elements data
        for element in elements {
            let elementData = element.data
            data.append(Int32(elementData.count).toData())
            data.append(element.data)
        }
        return data
    }

    /// A String version of the whole OSC message. This is helpful for printing and debuging.
    public var description: String {
        "OSCBundle [Timetag<\(timetag)> Elements<\(elements.count)>]"
    }

    // MARK: Initializers
    public init(_ timetag: Timetag) {
        self.timetag = timetag
    }

    public init (_ timetag: Timetag, _ elements: OSCElement...) {
        self.timetag = timetag
        self.elements = elements
    }

    public init (_ elements: OSCElement...) {
        timetag = 1
        self.elements = elements
    }

    // MARK: Methods
    public func add(_ elements: OSCElement...) {
        self.elements += elements
    }
}
