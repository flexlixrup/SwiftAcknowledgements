# SwiftAcknowledgements

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Overview

A Swift package which creates a SwiftUI View with Acknowledgements from 3rd party packages used in your project.

## Requirements

- iOS 15.0+ / macOS 12.0+ / watchOS 8.0+ / tvOS 15.0+ / visionOS 1.0+
- Swift 5.9+
- Xcode 14.0+

## Installation

### Swift Package Manager

To integrate `SwiftAcknowledgements` into your Xcode project using Swift Package Manager, follow these steps:

1. Open your project in Xcode.
2. Select `File` > `Swift Packages` > `Add Package Dependency...`.
3. Enter the package repository URL: `https://github.com/flexlixrup/SwiftAcknowledgements`.
4. Choose the latest release or specify a version range.
5. Add the package to your target.

Alternatively, you can add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/flexlixrup/SwiftAcknowledgements", from: "1.0.0")
]
```

Then, include `SwiftAcknowledgements` as a dependency in your target:

```swift
.target(
    name: "YourTargetName",
    dependencies: [
        "SwiftAcknowledgements"
    ]),
```

## Usage

### Basic Usage

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



## Contributing

If you would like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions, feel free to open an issue.
