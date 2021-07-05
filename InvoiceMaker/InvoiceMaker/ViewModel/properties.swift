//
//  properties.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI

class CollectedData: ObservableObject, Identifiable {
    @Published var businessData: [homescreenOptions]? = Array()
    @Published var ItemData: [invoiceItem]? = Array()
}


struct homescreenOptions: Identifiable  {
    
    var id = UUID()
    
    var navigationView: AnyView
    let navigationViewtitle: String
    let businessName: String
    let ABNNo: String
    
//    var items: Any
}


struct invoiceItem: Identifiable  {
    
    var id = UUID()
    var navigationView: AnyView
    var description: String
    let quantity: Double
    let rate: Double
    
}
