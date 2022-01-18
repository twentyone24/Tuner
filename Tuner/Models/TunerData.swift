//
//  TunerData.swift
//  Tuner
//
//  Created by NAVEEN MADHAN on 1/18/22.
//

struct TunerData {
    let pitch: Frequency
    let closestNote: ScaleNote.Match
}

extension TunerData {
    init(pitch: Float = 440) {
        self.pitch = Frequency(floatLiteral: Double(pitch))
        self.closestNote = ScaleNote.closestNote(to: self.pitch)
    }
}
