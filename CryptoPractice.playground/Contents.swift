import UIKit
import CryptoKit

let str = "I LOVE YOU"

func randomHashItem(item: String) -> Int {
  var hasher = Hasher()
  item.hash(into: &hasher)
  return hasher.finalize()
}

print("randomly generated :", randomHashItem(item: str))

func shaHashItem(item: String) -> SHA256.Digest?{
    if let data = item.data(using: .utf8) {
        let digest = SHA256.hash(data: data)
        return digest
    }
    return nil
}

print(String(describing: shaHashItem(item: str)))

let key256 = SymmetricKey(size: .bits256)

func hashSignItem<T:HashFunction>(item: String) -> HashedAuthenticationCode<T>? {
    if let data = str.data(using: .utf8) {
        let shaMAC = HMAC<T>.authenticationCode(
            for: data, using: key256)
        return shaMAC
    }
    return nil
}

let sha512AuthCode: HashedAuthenticationCode<SHA512>? = hashSignItem(item: str)
print(String(describing: sha512AuthCode))
let sha256AuthCode: HashedAuthenticationCode<SHA256>? = hashSignItem(item: str)
print(String(describing: sha256AuthCode))

func produceHashData<T: HashFunction>(code: HashedAuthenticationCode<T>?) -> Data {
    if let code = code {
        let authenticationCodeData = Data(code)
        return authenticationCodeData
    }
    return Data()
}

let sha512AuthCodeData = produceHashData(code: sha512AuthCode)
let sha256AuthCodeData = produceHashData(code: sha256AuthCode)

func validateData<T: HashFunction>(hasher: T.Type, authCode: Data, str: String) {
    guard let data = str.data(using: .utf8) else { return }
    if HMAC<T>.isValidAuthenticationCode(authCode,
                                              authenticating: data, using: key256) {
        print("The message authentication code is validating the data: (\(data))")
    }
    else { print("not valid") }
}

validateData(hasher:SHA512.self, authCode: sha512AuthCodeData, str: str)
validateData(hasher:SHA256.self ,authCode: sha256AuthCodeData, str: str)

let mySigningPrivateKey = Curve25519.Signing.PrivateKey()
let mySigningPublicKeyData =
  mySigningPrivateKey.publicKey.rawRepresentation

func testServerKeySignature() {
    if let data = str.data(using: .utf8) {
        let signatureForData = try! mySigningPrivateKey.signature(for: data)
        let digest512 = SHA512.hash(data: data)
        let signatureForDigest = try! mySigningPrivateKey.signature(
          for: Data(digest512))
        
        let publicKey = try! Curve25519.Signing.PublicKey(
          rawRepresentation: mySigningPublicKeyData)
        if publicKey.isValidSignature(signatureForData, for: data) {
          print("Server sent this data.")
        }
        if publicKey.isValidSignature(signatureForDigest,
          for: Data(digest512)) {
          print("Data received == data sent.")
          UIImage(data: data)
        }
    }
}


let serverPrivateKey = Curve25519.KeyAgreement.PrivateKey()
let serverPublicKeyData = serverPrivateKey.publicKey.rawRepresentation
let clientPrivateKey = Curve25519.KeyAgreement.PrivateKey()
let clientPublicKeyData = clientPrivateKey.publicKey.rawRepresentation

let protocolSalt = "Voldemort's Horcruxes".data(using: .utf8)!

let clientPublicKey = try! Curve25519.KeyAgreement.PublicKey(
  rawRepresentation: clientPublicKeyData)
let serverSharedSecret = try! serverPrivateKey.sharedSecretFromKeyAgreement(
  with: clientPublicKey)
let serverSymmetricKey = serverSharedSecret.hkdfDerivedSymmetricKey(
  using: SHA256.self, salt: protocolSalt,
  sharedInfo: Data(), outputByteCount: 32)

let serverPublicKey = try! Curve25519.KeyAgreement.PublicKey(
  rawRepresentation: serverPublicKeyData)
let clientSharedSecret = try! clientPrivateKey.sharedSecretFromKeyAgreement(
  with: serverPublicKey)
let clientSymmetricKey = clientSharedSecret.hkdfDerivedSymmetricKey(
  using: SHA256.self, salt: protocolSalt,
  sharedInfo: Data(), outputByteCount: 32)


if serverSymmetricKey == clientSymmetricKey {
  print("SERVER and CLIENT have the same symmetric key.")
}
