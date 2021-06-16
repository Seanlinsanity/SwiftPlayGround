import UIKit

enum Environment {
    case dev
    case stg
    case prd
}

let env = Environment.dev

enum ProductType: String, Codable {
    
    private enum Constants {
        static let developMacbookCode = "macBook_code_dev"
        static let stagingMacbookCode = "macBook_code_stg"
        static let productionMacbookCode = "macBook_code_prd"
    }

    case iPhone = "00"
    case iMac = "01"
    case airPods = "02"
    case iPad = "03"
    case macBook

    var code: String {
        switch self {
        case .iPhone:
            return ProductType.iPhone.rawValue
        case .iMac:
            return ProductType.iMac.rawValue
        case .airPods:
            return ProductType.airPods.rawValue
        case .iPad:
            return ProductType.iPad.rawValue
        case .macBook:
            switch env {
            case .dev:
                return Constants.developMacbookCode
            case .stg:
                return Constants.stagingMacbookCode
            case .prd:
                return Constants.productionMacbookCode
            }
        }
    }
    
    func encode(to encoder: Encoder) throws {
        return try code.encode(to: encoder)
    }
    
    init(from decoder: Decoder) throws {
        let contianter = try decoder.singleValueContainer()
        let decoded = try contianter.decode(RawValue.self)
        guard let instance = Self.init(rawValue: decoded) else {
            throw NSError(domain: "Decoder", code: -1, userInfo: ["message": "Invalid Product Code"])
        }
        self = instance
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case ProductType.iPhone.rawValue:
            self = .iPhone
        case ProductType.iMac.rawValue:
            self = .iMac
        case ProductType.airPods.rawValue:
            self = .airPods
        case ProductType.iPad.rawValue:
            self = .iPad
        default:
            if ProductType.isInstallmentBailoutProductCode(rawValue) {
                self = .macBook
            } else {
                return nil
            }
        }
    }
    
    private static func isInstallmentBailoutProductCode(_ value: String) -> Bool {
        [
            env == .dev && value == Constants.developMacbookCode,
            env == .stg && value == Constants.stagingMacbookCode,
            env == .prd && value == Constants.productionMacbookCode,
        ].contains(true)
    }
}

struct Product: Codable {
    let type: ProductType
}



let jsonStr =
"""
{"type": "macBook_code_stg"}
"""

let product = try? JSONDecoder().decode(Product.self, from: jsonStr.data(using: .utf8) ?? Data())
print(product?.type, product?.type.code)

let productCode = ProductType(rawValue: "00")
print(productCode, productCode?.code)

let productCode1 = ProductType(rawValue: "macBook_code_stg")
print(productCode1, productCode1?.code)

let macbook = Product(type: .macBook)
let productType = ProductType.macBook
let jsonVal = try? JSONEncoder().encode(macbook)
print(String.init(data: jsonVal ?? Data(), encoding: .utf8))
