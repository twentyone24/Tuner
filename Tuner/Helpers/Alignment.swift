//
//  Alignment.swift
//  Tuner
//
//  Created by NAVEEN MADHAN on 1/18/22.
//

import SwiftUI

extension HorizontalAlignment {
    enum NoteCenter: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    static let noteCenter = HorizontalAlignment(NoteCenter.self)
}
