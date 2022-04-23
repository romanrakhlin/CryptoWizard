//
//  Wallet.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/11/22.
//

import Foundation

/*
This implementation is not excact as in Bitcoin
bacause pure Swift is not allowing to implement some
complex cryptographic algorithms.
 
So we use more "Dummy" versions of those algorithms
*/

class Wallet {
    
    var privateKey: String?
    var publicKey: String?
    var address: String?
    
    func generateRandomHexLetter() -> Character {
        let hex: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
        
        let randomInt = Int(arc4random_uniform(16))

        return hex[randomInt]
    }
    
    func savePrivateKey(key: String) {
        self.privateKey = key
    }
    
    func generatePublicKey() -> String? {
        var result: String = ""
        
        guard let privateKey = self.privateKey else { return nil }

        let firstHalf: String = String(privateKey.prefix(privateKey.count/2))
        let secondHalf: String = String(privateKey.suffix(privateKey.count/2))
            
        result = firstHalf + secondHalf + firstHalf + secondHalf
            
        self.publicKey = result
        return result
    }
    
    func generateAddress() -> String? {
        var result: String = ""
        
        guard let publicKey = self.publicKey else { return nil }
        
        let temp = publicKey.data(using: .utf8)!
        let address = temp.sha256()
        
        result = address.toHex()
        
        self.address = result
        return result
    }
}
