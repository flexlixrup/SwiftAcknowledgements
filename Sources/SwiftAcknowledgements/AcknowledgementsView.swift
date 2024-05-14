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
		ScrollView {
			VStack {
				ForEach(Array(acknowledgements.enumerated()), id: \.element) { idx, acknowledgement in
					VStack {
						if acknowledgement.platforms.contains(.all) || acknowledgement.platforms.contains(Platform.currentPlatform) {
							Link(acknowledgement.swAckTitle.0, destination: acknowledgement.swAckTitle.1).font(.headline)
							Text(acknowledgement.swAckBody).multilineTextAlignment(.center)
							if idx != acknowledgements.count - 1 {
								Divider()
							}
						}
					}
				}
			}.padding(.vertical)
		}
	}
}
