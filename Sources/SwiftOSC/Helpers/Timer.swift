// -----------------------------------------------------------------------------------------------------------
// Timer.swift - This file is part of swift-osc
// -----------------------------------------------------------------------------------------------------------
// Copyright (c) 2020 - 2022 Fabian S. Klinke. All rights reserved.
// Unauthorised copying of this file, via any medium is strictly prohibited!
// -----------------------------------------------------------------------------------------------------------

import Foundation

// let sharedTimer = Timer()

class Timer {
    static let sharedTime = Timer()

    private var startMachTime: UInt64
    private var startNTP: UInt64
    private var numer: UInt64
    private var denom: UInt64

    var timetag: UInt64 {
        let time = (((mach_absolute_time() - startMachTime) * numer) / denom)
        let seconds = time / 0x100000000
        let nano = time % 0x100000000
        var tag = startNTP + ((nano * 0x100000000) / 1_000_000_000)
        tag = tag + seconds * 0x100000000

        return tag
    }

    private init() {
        // set program start time
        startMachTime = mach_absolute_time()

        // set numer and denom
        var s_timebase_info = mach_timebase_info_data_t()
        mach_timebase_info(&s_timebase_info)
        numer = UInt64(s_timebase_info.numer)
        denom = UInt64(s_timebase_info.denom)

        // set start time
        let calendar = Calendar.current
        let dateComponents = DateComponents(timeZone: TimeZone(secondsFromGMT: 0), year: 1_990)
        let date = calendar.date(from: dateComponents)
        let timeInterval = Date().timeIntervalSince(date!)
        startNTP = UInt64(timeInterval * 0x100000000)
    }
}
