//
//  AcknowledgementsView.swift
//
//
//  Created by Felix Ruppert on 14.05.24.
//

import SwiftUI

public struct AcknowledgementsView: View {
	@State var acknowledgements: [SwAcknowledgement]
	public init(acknowledgements: [SwAcknowledgement]) {
		_acknowledgements = State(initialValue: acknowledgements)
	}

	public var body: some View {
		ForEach(Array(acknowledgements.enumerated()), id: \.element) { idx, acknowledgement in
			ScrollView {
				VStack {
					if acknowledgement.platforms.contains(.all) {
						Link(acknowledgement.swAckTitle.0, destination: acknowledgement.swAckTitle.1).font(.headline)
						Text(acknowledgement.swAckBody).multilineTextAlignment(.center)
					} else if acknowledgement.platforms.contains(Platform.currentPlatform) && !acknowledgement.platforms.contains(.all) {
						Link(acknowledgement.swAckTitle.0, destination: acknowledgement.swAckTitle.1).font(.headline)
						Text(acknowledgement.swAckBody).multilineTextAlignment(.center)
					}
					if idx == acknowledgements.count - 1 {
						Divider()
					}
				}
			}
		}
	}
}
