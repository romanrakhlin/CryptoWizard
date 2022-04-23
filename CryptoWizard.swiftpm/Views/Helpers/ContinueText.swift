//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/19/22.
//

import SwiftUI

struct ContinueText: View {

    var body: some View {
        Text("Tap to contiue")
            .textCase(.uppercase)
            .font(.system(size: 32, weight: .light, design: .rounded))
            .opacity(0.6)
    }
}
