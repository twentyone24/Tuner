//
//  ModifierPreference.swift
//  Tuner
//
//  Created by NAVEEN MADHAN on 1/18/22.
//

enum ModifierPreference: Int, Identifiable, CaseIterable {
    case preferSharps, preferFlats

    var toggled: ModifierPreference {
        switch self {
        case .preferSharps:
            return .preferFlats
        case .preferFlats:
            return .preferSharps
        }
    }

    var id: Int { rawValue }
}
