# ``SwiftAcknowledgements``

A Swift package which creates a SwiftUI View with Acknowledgements from 3rd party packages used in your project.

## Overview

The package can be used on following platforms:

- iOS 15.0+
- macOS 12.0+
- watchOS 8.0+
- tvOS 15.0+
- visionOS 1.0+

Also you need at least Swift 5.9 and Xcode 14.0

### Basic usage

```swift
import SwiftAcknowledgements
import SwiftUI

struct ContributionView: View {
	let acktitle: SwAckTitle
	let ackBody: SwAckBody
	let ack: SwAcknowledgement?
	init() {
		self.acktitle = SwAckTitle("SwiftAcknowledgements", url: "https://github.com/flexlixrup/SwiftAcknowledgements")
		self.ackBody = SwAckBody(maintainers: ["2024, Felix Ruppert"], licence: .MIT)
		self.ack =  try? SwAcknowledgement(swAckTitle: acktitle, swAckBody: ackBody, platforms: [.all])
	}
	
	 
	var body: some View {
		if let ack {
			AcknowledgementsView(acknowledgements: [ack])
		}
	}
}
```

## Topics

### View

- ``AcknowledgementsView``
