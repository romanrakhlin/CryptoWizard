//
//  ThankYouView.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/18/22.
//

import SwiftUI

struct ThankYouView: View {
    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
            
            Text("Thank you!")
                .font(.system(size: 56, weight: .bold, design: .rounded))
        }
        .ignoresSafeArea(.all)
    }
}
