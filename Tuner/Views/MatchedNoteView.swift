//
//  MatchedNoteView.swift
//  Tuner
//
//  Created by NAVEEN MADHAN on 1/18/22.
//

import SwiftUI

struct MatchedNoteView: View {
    let match: ScaleNote.Match
    let modifierPreference: ModifierPreference

    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            MainNoteView(note: note)
                .animation(nil) // Don't animate text frame
                .animatingPerceptibleForegroundColor(isPerceptible: match.distance.isPerceptible)
            VStack(alignment: .leading) {
                if let modifier = modifier {
                    Text(modifier)
                        // TODO: Avoid hardcoding size
                        .font(.system(size: 50, design: .rounded))
                        .animatingPerceptibleForegroundColor(isPerceptible: match.distance.isPerceptible)
                    Spacer()
                        .frame(height: 24) // TODO: Fix this with alignment guides
                }
                Text(String(describing: match.octave))
                    // TODO: Avoid hardcoding size
                    .font(.system(size: 40, design: .rounded))
                    .foregroundColor(.secondary)
            }
        }
        .animation(.easeInOut, value: match.distance.isPerceptible)
    }

    private var preferredName: String {
        switch modifierPreference {
        case .preferSharps:
            return match.note.names.first!
        case .preferFlats:
            return match.note.names.last!
        }
    }

    private var note: String {
        return String(preferredName.prefix(1))
    }

    private var modifier: String? {
        return preferredName.count > 1 ?
            String(preferredName.suffix(1)) :
            nil
    }
}

private extension View {
    func animatingPerceptibleForegroundColor(isPerceptible: Bool) -> some View {
        return self
            .animatingForegroundColor(from: .green, to: .red, percentToColor: isPerceptible ? 1 : 0)
    }
}

struct MatchedNoteView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedNoteView(
            match: ScaleNote.Match(
                note: .ASharp_BFlat,
                octave: 4,
                distance: 0
            ),
            modifierPreference: .preferSharps
        )
        .previewLayout(.sizeThatFits)
    }
}
