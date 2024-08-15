// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swiftlint:disable all

import PackageDescription

let package = Package(
  name: "KIBI-Library",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "KIBI-InterfaceKit",
      targets: ["InterfaceKit"]
    ),
    .library(
      name: "KIBI-Thuzi",
      targets: ["Thuzi"]
    ),
    .library(
      name: "KIBI-Event",
      targets: ["Event"]
    ),
    .library(
      name: "KIBI-Ticketing",
      targets: ["Ticketing"]
    ),
    .library(
      name: "KIBI-Maps",
      targets: ["Maps"]
    ),
    .library(
      name: "KIBI-KibiGimbal",
      targets: ["KibiGimbal"]
    ),
    .library(
      name: "KIBI-OneTrust",
      targets: ["OneTrust"]
    ),
    .library(
      name: "KIBI-KibiQuantcast",
      targets: ["KibiQuantcast"]
    ),
    .library(
      name: "KIBI-Ticketmaster",
      targets: ["Ticketmaster"]
    ),
    .library(
      name: "KIBI-CrowdConnected",
      targets: ["CrowdConnected"]
    ),
    .library(
      name: "KIBI-Permutive",
      targets: ["Permutive"]
    ),
    .library(
      name: "KIBI-GoogleAds",
      targets: ["GoogleAds"]
    ),
    .library(
      name: "KIBI-KibiSnapchat",
      targets: ["KibiSnapchat"]
    ),
    .library(
      name: "KIBI-KibiMixpanel",
      targets: ["KibiMixpanel"]
    ),
    .library(
      name: "KIBI-KibiOneSignal",
      targets: ["KibiOneSignal"]
    ),
    .library(
      name: "KIBI-KibiFirebase",
      targets: ["KibiFirebase"]
    )
  ],
  dependencies: [
    .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk", from: "10.9.0"),
    .package(name: "swift-atomics", url: "https://github.com/Apple/Swift-Atomics", from: "1.0.0"),
    .package(name: "swift-collections", url: "https://github.com/Apple/Swift-Collections", from: "1.0.0"),
    .package(name: "SwiftyBeaver", url: "https://github.com/SwiftyBeaver/SwiftyBeaver", from: "1.0.0"),
    .package(name: "ZipArchive", url: "https://github.com/patrontech/ZipArchive", .exact("2.1.6")),
    .package(name: "SVGKit", url: "ssh://git@github.com/patrontech/KIBI-SVGKit", .exact("4.0.0")),
    .package(name: "Fuse", url: "ssh://git@github.com/patrontech/KIBI-Fuse", .exact("1.4.0")),
    .package(name: "Realm", url: "https://github.com/realm/realm-swift", .exact("10.42.1")),
    .package(name: "Parsimonious", url: "ssh://git@github.com/patrontech/KIBI-Parsimonious", from: "2.3.0"),
    .package(name: "Gimbal", url: "ssh://git@github.com/patrontech/KIBI-Gimbal", from: "2.92.1"),
    .package(name: "OTPublishersHeadlessSDK", url: "https://github.com/Zentrust/OTPublishersHeadlessSDK", .exact("202302.1.0")),
    .package(name: "Quantcast", url: "ssh://git@github.com/patrontech/KIBI-Quantcast", .exact("1.7.1")),
    .package(name: "Ticketmaster", url: "ssh://git@github.com/ticketmaster/iOS-TicketmasterSDK", .exact("1.4.0")),
    .package(name: "CrowdConnectedCore", url: "https://github.com/crowdconnected/crowdconnected-core-ios", .exact("1.5.1")),
    .package(name: "CrowdConnectedIPS", url: "https://github.com/crowdconnected/crowdconnected-ips-ios", .exact("1.5.1")),
    .package(name: "CrowdConnectedGeo", url: "https://github.com/crowdconnected/crowdconnected-geo-ios", .exact("1.5.1")),
    .package(name: "CrowdConnectedCoreBluetooth", url: "https://github.com/crowdconnected/crowdconnected-core-bluetooth-ios", .exact("1.5.1")),
    .package(name: "Permutive_iOS", url: "https://github.com/permutive-engineering/permutive-ios-spm", .exact("1.5.0")),
    .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", .exact("10.11.0")),
    .package(name: "CameraKitReferenceUI", url: "ssh://git@github.com/patrontech/KIBI-Snapchat-CameraKitReferenceUI", from: "1.19.3"),
    .package(name: "CameraKit", url: "ssh://git@github.com/patrontech/KIBI-Snapchat", from: "1.19.2"),
    .package(name: "Mixpanel", url: "https://github.com/mixpanel/mixpanel-swift", .exact("4.0.4")),
    .package(name: "OneSignal-XCFramework", url: "https://github.com/OneSignal/OneSignal-XCFramework", .exact("3.12.3")),
  ],
  targets: [
    .target(
      name: "ToolKit",
      dependencies: [
        .product(name: "Atomics", package: "swift-atomics"),
        .product(name: "Collections", package: "swift-collections"),
        "SwiftyBeaver",
        "ZipArchive"
      ],
      path: "ToolKit/Library"
    ),
    .target(
      name: "Core",
      dependencies: ["ToolKit", "Parsimonious"],
      path: "Core/Library"
    ),
    .target(
      name: "InterfaceKit",
      dependencies: [
        "Core",
        "SVGKit",
        "Fuse",
        .product(name: "FirebaseCrashlytics", package: "Firebase")
      ],
      path: "InterfaceKit/Library"
    ),
    .target(
      name: "Thuzi",
      dependencies: ["InterfaceKit"],
      path: "Thuzi/Library"
    ),
    .target(
      name: "Event",
      dependencies: [
        "InterfaceKit",
        .product(name: "RealmSwift", package: "Realm")
      ],
      path: "Event/Library"
    ),
    .target(
      name: "Ticketing",
      dependencies: ["InterfaceKit"],
      path: "Ticketing/Library"
    ),
    .target(
      name: "Maps",
      dependencies: ["InterfaceKit"],
      path: "Maps/Library"
    ),
    .target(
      name: "KibiGimbal",
      dependencies: ["Gimbal", "Core", "InterfaceKit"],
      path: "KibiGimbal/Library"
    ),
    .target(
      name: "KibiSnapchat",
      dependencies: [
        .product(name: "SCSDKCameraKit", package: "CameraKit"),
        .product(name: "SCSDKCameraKitReferenceUI", package: "CameraKitReferenceUI"),
        "Core",
        "InterfaceKit"],
      path: "KibiSnapchat/Library"
    ),
    .target(
      name: "OneTrust",
      dependencies: ["OTPublishersHeadlessSDK", "InterfaceKit"],
      path: "OneTrust/Library"
    ),
    .target(
      name: "KibiQuantcast",
      dependencies: ["Quantcast", "Core"],
      path: "KibiQuantcast/Library"
    ),
    .target(
      name: "Ticketmaster",
      dependencies: [
        "InterfaceKit",
        .product(name: "TicketmasterTickets", package: "Ticketmaster"),
        .product(name: "TicketmasterAuthentication", package: "Ticketmaster"),
        .product(name: "TicketmasterDiscoveryAPI", package: "Ticketmaster"),
        .product(name: "TicketmasterFoundation", package: "Ticketmaster"),
        .product(name: "TicketmasterPrePurchase", package: "Ticketmaster"),
        .product(name: "TicketmasterPurchase", package: "Ticketmaster"),
        .product(name: "TicketmasterSecureEntry", package: "Ticketmaster")
      ],
      path: "Ticketmaster/Library"
    ),
    .target(
      name: "CrowdConnected",
      dependencies: ["CrowdConnectedCore", "CrowdConnectedIPS", "CrowdConnectedGeo", "Core", "CrowdConnectedCoreBluetooth"],
      path: "CrowdConnected/Library"
    ),
    .target(
        name: "Permutive",
        dependencies: ["Core", "Permutive_iOS"],
        path: "Permutive/Library"
    ),
    .target(
      name: "GoogleAds",
      dependencies: ["GoogleMobileAds", "InterfaceKit"],
      path: "GoogleAds/Library"
    ),
    .target(
      name: "KibiMixpanel",
      dependencies: ["Core", "Mixpanel"],
      path: "KibiMixpanel/Library"
    ),
    .target(
      name: "KibiOneSignal",
      dependencies: [
        "Core",
        .product(name: "OneSignal", package: "OneSignal-XCFramework")
      ],
      path: "KibiOneSignal/Library"
    ),
    .target(
      name: "KibiFirebase",
      dependencies: [
        "Core",
        .product(name: "FirebaseAnalytics", package: "Firebase")
      ],
      path: "KibiFirebase/Library"
    )
  ]
)
