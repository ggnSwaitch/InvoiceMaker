//
//  BussinessView.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI


struct BussinessView: View {
    //    @State var listItems = [Item]()
    
    @State var addItemName: String = ""
    
    @State var colorSelection: String = ""
    
    @State var addItem = false
    
    @State var addItemValue: String = ""
    
    @State var nameValue: String = ""
    @State var addressValue: String = ""
    @State var abnValue: String = ""
    @State var contactValue: String = ""
    
    @EnvironmentObject var bussinessInfo: CollectedData
    var body: some View {
        ZStack {
            VStack {
                NavigationView {
                    VStack{
                            HStack{
                                Text("Name")
                                TextField("Enter Name Here", text: self.$nameValue)
                            }
                            HStack{
                                Text("Address")
                                TextField("Enter address Here", text: self.$addressValue)
                            }
                            HStack{
                                Text("ABN No.")
                                TextField("Enter ABN Here", text: self.$abnValue)
                            }
                            HStack{
                                Text("Contact")
                                TextField("Enter Contact Here", text: self.$contactValue)
                            }

                    }
                    .padding()
                    .frame(width: .infinity, height: 650, alignment: .top)
                    
                    // This is our secondary view that'll take in our user's input.
                    // Is presented when addItem is set to true.
                }
            }
        }
        .onDisappear(){
            let infomation = homescreenOptions(navigationView: AnyView(BussinessView()), navigationViewtitle: "Business Information", businessName: self.nameValue, ABNNo: self.abnValue)
            bussinessInfo.businessData?.append(infomation)
            
        }
    }
    
}

struct BussinessView_Previews: PreviewProvider {
    static var previews: some View {
        BussinessView()
    }
}
