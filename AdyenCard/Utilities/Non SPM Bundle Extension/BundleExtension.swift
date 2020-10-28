//
// Copyright (c) 2020 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
import Foundation

/// This is excluded from the Swift Package, since swift packages has different code to access internal resources.
/// The Bundle extension in `BundleSPMExtension.swift` is used instead.
internal extension Bundle {
    // swiftlint:disable explicit_acl

    /// The main bundle of the framework.
    private static let core: Bundle = {
        Bundle(for: ThreeDS2Component.self)
    }()

    /// The bundle in which the framework's resources are located.
    static let internalResources: Bundle = {
        internalBundle(withName: "AdyenCard", inBundle: core)
    }()

    // swiftlint:enable explicit_acl
}
