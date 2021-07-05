//
//  ServicesView.swift
//  EasyInvoice
//
//  Created by GaGan on 5/4/21.
//

import SwiftUI
import Foundation

class ItemsDetails: ObservableObject {
    @Published var itemsData = [String:Any]()
}


struct AddItemView: View {
    @State var listItems = [Item]()
    
    @State var addItemName: String = ""
    
    @State var addItem = false
    
    @State var addItemValue: String = ""
    
    @State var dateValue = Date()
    let dateFormatter = DateFormatter()
   
    
    @State var quantityValue: String = ""
    @State var unitcostValue: String = ""
    @State var totalValue: String = ""
    @State var totalGST: String = ""
    
    @EnvironmentObject var itemInfo: CollectedData
    @StateObject private var dic = ItemsDetails()
    
    @State private var isPresented = false
    
    @State var itemssDict = Dictionary<String,Any>()
    //    var itemssDict = Array<Dictionary<String,Any>>()
    
    private var resultInt: String {
        return String(Int(self.totalValue ?? "0") ?? 0 * 2)
    }
    
    var itemsDictionary : [String:Any] {
        return ["Date":self.dateValue, "Quantity":self.quantityValue, "UnitCost":self.unitcostValue, "total":self.totalValue, "GST":self.totalGST]
        
    }
   
    
    var body: some View {
        ZStack {
            VStack {
                    VStack{
                        VStack{
                            HStack{
                                    
                                    Text("Date:")
                                    DatePicker(selection: $dateValue, in: ...Date(), displayedComponents: .date) {
                                               }
                            }
                            HStack{
                                Text("Qunantity:")
                                TextField("Enter Quantity/hours Here", text: self.$quantityValue)
                            }
                            HStack{
                                Text("Unit Cost:")
                                TextField("", text: $unitcostValue, onEditingChanged: { (changed) in
                                   // @StateObject var dic = OtherBussDic()                                    cal(firstValue: self.quantityValue, secondValue: self.unitcostValue)
                                })
                                
                            }
                            HStack{
                                Text("Total:")
                                TextField("" , text: $totalValue)
                            }
                            HStack{
                                Text("GST (10%):")
                                Text("$\(calGST(totalValue: self.totalValue))")
                               
                            }
                        }
                        
                        List {
                            ForEach(listItems, id: \.self) { item in
                                HStack {
                                    Text(item.name)
                                    Text(item.value)
                                }
                                
                            }
                            .onDelete(perform: delete)
                        }

                        .navigationBarTitle(Text("Add Items"))
                }

            }
        }
        .onDisappear()
        {
            addItemDetails()
        }
    }
    
    func addItemDetails(){
        
        let information = invoiceItem(navigationView: AnyView(AddItemView()), description:"" , quantity: Double(self.quantityValue) ?? 0, rate: 0)
//        let infomation = invoiceItem(navigationView: AnyView(AddItemView), quantityValue: self.quantityValue, unitcostValue: self.unitcostValue, totalValue: self.totalValue, totalGST: self.totalGST)
        itemInfo.ItemData?.append(information)

    }
    
    
    func delete(at offsets: IndexSet) {
        // delete the objects here
        //  listItems.append(Item(name: "Name", value: self.addItemValue))
    }
    
    
    
    func cal(firstValue: String, secondValue: String) -> String
    {
        if(firstValue.isEmpty || secondValue.isEmpty)
        {
            return "";
        }
        else{
            self.totalValue = String(Int(firstValue)! * Int(secondValue)!)
            return String(Int(firstValue)! * Int(secondValue)!)
        }
    }
    
    func calGST(totalValue: String) -> String
    {
        if(totalValue.isEmpty)
        {
            return "";
        }
        else{
            let val = 10 * Double(totalValue)!
            return String(val / 100.00)
        }
    }
    
    mutating func addItemss(){
        
//        print(otherDetailsDic)
  
    }
    

}


struct ViewControllerWrapper:
 UIViewControllerRepresentable
{
    let controller: UIViewController?
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> UIViewController {
        guard let controller = controller else {
            return UIViewController()
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }
}


struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(quantityValue: "", unitcostValue: "", totalValue: "", totalGST: "")
    }
}



