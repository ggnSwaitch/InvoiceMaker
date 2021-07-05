//
//  ListCell.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI

struct ItemCell: View {
    
    var label: String
    var value: String
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                //                .fill(Color .gray)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .topTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal, -5)
            Text(label)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 210))
            Text(value)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 140))

            
        }
    }
}
