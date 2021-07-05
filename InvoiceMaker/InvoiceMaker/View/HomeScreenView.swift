//
//  HomeScreenView.swift
//  InvoiceMaker
//
//  Created by GaGan on 5/6/21.
//

import SwiftUI

struct HomeScreenView: View {
    
    @EnvironmentObject var bussinessInfo: CollectedData
    var bussInfo: [homescreenOptions] = [
        homescreenOptions(navigationView: AnyView(BussinessView()), navigationViewtitle: "From:", businessName: "", ABNNo: ""),
        homescreenOptions(navigationView: AnyView(FromBussinesView()), navigationViewtitle: "To:", businessName: "", ABNNo: "")
    ]
    
    var itemInfo: [invoiceItem] = [invoiceItem(navigationView: AnyView(AddItemView()), description: "", quantity: 0, rate: 0)]
    
    @State private var selection: String?
    
    let item = ["Add item"];
    @State var test: String?
    var body: some View {
        NavigationView{
            VStack{
                
                List {
                    Section(header: Text("Business Information")){
                        
                        if bussinessInfo.businessData?.count == 0 {
                            
                            ForEach(Array(bussInfo.enumerated()), id: \.1.id) {(index, item) in
                                
                                NavigationLink(destination: item.navigationView) {
                                    
                                    ItemCell(label: item.navigationViewtitle , value:"")
                                        .frame(height: 50)
                                }
                                
                            }
                            
                        }
                        else
                        {
                            ForEach(Array(bussInfo.enumerated()), id: \.1.id) {(index, item) in
                                if (self.bussinessInfo.businessData!.count > index)
                                {
                                    NavigationLink(destination: item.navigationView) {
                                        
                                        ItemCell(label: item.navigationViewtitle , value:self.bussinessInfo.businessData![index].ABNNo )
                                            .frame(height: 50)
                                    }
                                }
                                else
                                {
                                    NavigationLink(destination: item.navigationView) {
                                        
                                        ItemCell(label: item.navigationViewtitle , value: "")
                                            .frame(height: 50)
                                    }
                                }
                                
                                
                            }
                        }
                        
                        
                        
                        //                        .listSeparatorStyleNone()
                        //                        .listStyle(GroupedListStyle())
                        //                        .listRowBackground(Color .lightGray)
                        //                        .listRowInsets(EdgeInsets(top:5,leading: 15 ,bottom:0,trailing: 15)
                        //                        )
                        
                    }.frame(width: .infinity, height: 55, alignment: .bottomLeading)
                    
                    Section(header: Text("Invoice Items"))
                    {
                        ForEach(Array(bussinessInfo.ItemData!.enumerated()), id: \.1.id) {(index, item) in
                            NavigationLink(destination: AddItemView(quantityValue: String(format: "%f", item.quantity), unitcostValue: "", totalValue: "", totalGST: "")) {
                                ItemCell(label: String(format: "%f", item.quantity) , value: "")
                                    .frame(height: 60)
                            }
                            
                        }
                        NavigationLink(destination: AddItemView(quantityValue: "", unitcostValue: "", totalValue: "", totalGST: "")) {
                            ItemCell(label: "Add Item" , value: "")
                                .frame(height: 60)
                        }
                        .listSeparatorStyleNone()
                        //.listStyle(SidebarListStyle())
                       // .listRowBackground(Color .lightGray)
                        .listRowInsets(EdgeInsets(top:0,leading: 15 ,bottom:0,trailing: 15)
                        )
                    }
                    .frame(width: .infinity, height: 55, alignment: .bottomLeading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    
                }
                .navigationBarTitle("Invoice Maker")
                
            }
        }
        
    }
    
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


extension Color {
    public static var lightGray: Color {
        return Color(UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0))
    }
}



