// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct SwAckTitle {
	var title: String
	var url: String

	public init(_ title: String, url: String) {
		self.title = title
		self.url = url
	}
}

public struct SwAckBody {
	var maintainers: [String]
	var licence: LicenceType

	public init(maintainers: [String], licence: LicenceType) {
		self.maintainers = maintainers
		self.licence = licence
	}
}

public enum LicenceType {
	case MIT
	var licenceTitle: String {
		switch self {
			case .MIT:
				"MIT License"
		}
	}

	var licenceText: String {
		switch self {
			case .MIT:
				"Permission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the \"Software\"), to deal\nin the Software without restriction, including without limitation the rights\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all\ncopies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\nSOFTWARE."
		}
	}
}

public struct SwAcknowledgement: Identifiable, Hashable {
	public static func == (lhs: SwAcknowledgement, rhs: SwAcknowledgement) -> Bool {
		lhs.id == rhs.id
	}

	public func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}

	public var id = UUID()
	private var swAckTitleText: SwAckTitle
	private var swAckBodyText: SwAckBody
	var platforms: [Platform]
	var swAckTitle: (String, URL) = ("", URL(string: "http://example.com")!)
	var swAckBody: String = ""

	public init(swAckTitle: SwAckTitle, swAckBody: SwAckBody, platforms: [Platform]) throws {
		self.platforms = platforms
		swAckTitleText = swAckTitle
		swAckBodyText = swAckBody
		self.swAckBody = buildAckBody(title: swAckTitleText, body: swAckBodyText)
		do {
			self.swAckTitle = try buildAckTitle(title: swAckTitleText)
		} catch {
			throw Errors.couldNotParseLinkError
		}
	}

	private func buildAckTitle(title: SwAckTitle) throws -> (String, URL) {
		if let url = URL(string: title.url) {
			return (title.title, url)
		}
		throw Errors.couldNotParseLinkError
	}

	private func buildAckBody(title: SwAckTitle, body _: SwAckBody) -> String {
		var fullBody = "\(swAckBodyText.licence.licenceTitle)\n\n"
		fullBody += "\(buildCopyrightNotice(title: title))\n"
		fullBody += swAckBodyText.licence.licenceText
		return fullBody
	}

	private func buildCopyrightNotice(title _: SwAckTitle) -> String {
		var fullText = ""
		for maintainer in swAckBodyText.maintainers {
			let text = "Copyright (c) \(maintainer)\n"
			fullText += text
		}
		return fullText
	}
}

public enum Platform {
	case all
	case iOS
	case watchOS
	case macOS
	case visionOS
	case tvOS

	static var currentPlatform: Platform {
		#if os(iOS)
			return .iOS
		#elseif os(macOS)
			return .macOS
		#elseif os(tvOS)
			return .tvOS
		#elseif os(watchOS)
			return .watchOS
		#elseif os(visionOS)
			return .visionOS
		#endif
	}
}

enum Errors: Error, LocalizedError {
	case couldNotParseLinkError
	var errorDescription: String? {
		switch self {
			case .couldNotParseLinkError:
				"Could not parse the link"
		}
	}
}
