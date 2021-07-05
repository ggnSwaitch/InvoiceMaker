//
//  SwiftUIView.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI

class OtherBussinessDetails: ObservableObject {
    @Published var otherBussData = [String:Any]()
}

struct FromBussinesView: View {
    // @State var listItems = [Item]()
    
    @State var addItemName: String = ""
    
    @State var colorSelection: String = ""
    
    @State var addItem = false
    
    @State var addItemValue: String = ""
    
    @State var nameValue: String = ""
    @State var addressValue: String = ""
    @State var abnValue: String = ""
    @State var contactValue: String = ""
    @State var dict = [String: String]()
    @StateObject private var dic = OtherBussinessDetails()
    @EnvironmentObject var bussinessInfo: CollectedData

    
    // @EnvironmentObject private var bussDetailsDic: BussDetails
    var body: some View {
        VStack {
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
        }.padding()
        .frame(width: .infinity, height: 650
               , alignment: .top)
        
        .onDisappear(){
            let infomation = homescreenOptions(navigationView: AnyView(BussinessView()), navigationViewtitle: "Other Business Information", businessName: self.nameValue, ABNNo: self.abnValue)
            bussinessInfo.businessData?.append(infomation)
            
        }

        
        .navigationBarTitle(Text("Invoice To:  Details"))
        
        // Adds the plus button to our navbar
        .navigationBarItems(trailing:
                                Button(action: {
                                    
                                    // toggles the value of our bool from false to true,
                                    // which will present our sheet.
                                    self.addItem.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                })
                            
                                                            
        )
        
    }
    
    
    
    
    func addOtherBussDetails(){
        var bussDetailsDict = Dictionary<String,Any>()
        var addOtherBussDetailsDict = Dictionary<String,Any>()  //Your array
        
        
        let stringValue: String = self.nameValue + " \n " + self.addressValue + " \n "  + self.abnValue + " \n " + self.contactValue
        
        //  bussDetailsDict.updateValue(bussDetailsDic.bussDic, forKey: "BusinessDetails")
        
        bussDetailsDict.updateValue(stringValue, forKey: "OtherBusinessDetails")
        
        dic.otherBussData = bussDetailsDict
    }
    
}



struct FromBussinesView_Previews: PreviewProvider {
    static var previews: some View {
        FromBussinesView()
    }
}
