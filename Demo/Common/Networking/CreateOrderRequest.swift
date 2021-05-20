//
// Copyright (c) 2021 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
#if canImport(AdyenCard)
    import AdyenCard
#endif
import Foundation

internal struct CreateOrderRequest: Request {

    internal typealias ResponseType = CreateOrderResponse

    internal let amount: Payment.Amount

    internal let reference: String

    internal let path = "orders"

    internal var counter: UInt = 0

    internal var method: HTTPMethod = .post

    internal var headers: [String: String] = [:]

    internal var queryParameters: [URLQueryItem] = []

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        let configurations = ConfigurationConstants.current

        try container.encode(amount, forKey: .amount)
        try container.encode(reference, forKey: .reference)
        try container.encode(configurations.merchantAccount, forKey: .merchantAccount)
    }

    private enum CodingKeys: String, CodingKey {
        case amount
        case reference
        case merchantAccount
    }
}

internal struct CreateOrderResponse: Response {

    internal let resultCode: PaymentsResponse.ResultCode

    internal let pspReference: String

    internal let reference: String

    internal let remainingAmount: Payment.Amount

    internal let expiresAt: String

    internal let orderData: String

    internal var order: PartialPaymentOrder {
        PartialPaymentOrder(pspReference: pspReference, orderData: orderData)
    }
}