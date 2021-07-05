//
//  AddItemCell.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI

struct AddItemCell: View {
    
    var item: String?
    @State var items: String?
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                //                .fill(Color .gray)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .clipShape(RoundedRectangle(cornerRadius: 4))
                .padding(.horizontal, -10)
            //                .shadow(color: Color.gray, radius: 3, x: 3, y: 3)
            
        }
    }
}


struct AddItemCell_Previews: PreviewProvider {
    static var previews: some View {
        AddItemCell()
    }
}
