//
//  OSCTypes.swift
//  SwiftOSC
//
//  Created by Devin Roth on 6/26/16.
//  Copyright © 2016 Devin Roth Music. All rights reserved.
//

import Foundation


/// Protocol for all OSC types that are sent/received. OSCMessage and OSCBundle conform to this protocol
public protocol OSCElement {
    var data: Data { get }
}
