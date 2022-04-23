//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/23/22.
//

import Foundation

extension Data {
    
    // Fast convert to hex by reserving memory (instead of mapping and join).
    public func toHex() -> String {
        // Constants (Hex has 2 characters for each Byte).
        let size = self.count * 2;
        let degitToCharMap = Array(("0123456789ABCDEF").utf16);
        // Reserve dynamic memory (plus one for null termination).
        let buffer = UnsafeMutablePointer<unichar>.allocate(capacity: size + 1);
        
        // Convert each byte.
        var index = 0
        for byte in self {
            buffer[index] = degitToCharMap[Int(byte / 16)];
            index += 1;
            buffer[index] = degitToCharMap[Int(byte % 16)];
            index += 1;
        }
        
        // Set Null termination.
        buffer[index] = 0;
        // Casts to string (without any copying).
        return String(utf16CodeUnitsNoCopy: buffer,
                      count: size, freeWhenDone: true)
    }
}

public extension Data {
    
    func sha256() -> Data {
        let bytes: [UInt8] = Array(self)
        let result = SHA256(bytes).calculate32()
        return Data(bytes: result)
    }
}
