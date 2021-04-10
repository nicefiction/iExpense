//  AddExpenseItem.swift

import SwiftUI



struct AddExpenseItem: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var expenseItems: ExpenseItems
    
    @State private var name: String = "Another Item"
    @State private var selectedType: String = "personal"
    @State private var amount: String = "5"
    @State private var isShowingInvalidDataAlert: Bool = false
    
    
    
     // ////////////////
    // MARK: PROPERTIES
    
    static let itemTypes: [String] = [ "personal" , "business" ]
    
    
    
     // /////////////////////////
    //  MAR: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header : Text("Item name :")) {
                    TextField("Item name ..." , text : $name)
                }
                Section(header : Text("Item type :")) {
                    Picker("Item type" , selection : $selectedType) {
                        // ForEach(AddExpenseItem.itemTypes , id : \.self) {
                        ForEach(Self.itemTypes , id : \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Item amount :")) {
                    TextField("Item amount ..." ,
                              text : $amount)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Create a new Item")
            .navigationBarItems(
                trailing : Button(action : {
                    if let _amount = Int(amount) {
                        let expenseItem = ExpenseItem(name : name ,
                                                      type : selectedType ,
                                                      amount : _amount)
                        expenseItems.list.append(expenseItem)
                        
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        isShowingInvalidDataAlert.toggle()
                    }
                } , label : {
                    Text("Save item")
                })
            )
            .alert(isPresented: $isShowingInvalidDataAlert) {
                Alert(title : Text("Invalid data .") ,
                      message : Text("Enter a number .") ,
                      dismissButton : .default(Text("Cancel")))
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct AddExpenseItem_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddExpenseItem(expenseItems : ExpenseItems())
    }
}
