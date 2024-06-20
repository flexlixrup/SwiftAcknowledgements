//
//  AcknowledgementsView.swift
//
//
//  Created by Felix Ruppert on 14.05.24.
//

import SwiftUI

/// The SwiftUI View, where your acknowledgements will be displayed.
public struct AcknowledgementsView: View {
	@State var acknowledgements: [SwAcknowledgement]
	/// Initializes with an array of acknowledgements
	/// - Parameter acknowledgements: The acknowledgements array
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
			}
			#if os(macOS)
			.padding(.vertical)
			#else
			.padding()
			#endif
			.onAppear {
				let ack = try! SwAcknowledgement(swAckTitle: SwAckTitle("SwiftAcknowledgements", url: "https://github.com/flexlixrup/SwiftAcknowledgements"), swAckBody: SwAckBody(maintainers: ["2024, Felix Ruppert"], licence: .MIT), platforms: [.all])
				acknowledgements.append(ack)
			}
		}
	}
}
