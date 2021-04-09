// MARK:  ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var expenses = ExpenseItems()
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            List {
                // ForEach(expenses.list , id : \.name) { (item: ExpenseItem) in
                /**
                 Because `ExpenseItem` conforms to the `Identifiable` protocol
                 and has `id: UUID = UUID()` implemented ,
                 we no longer need to write `id : \.name` in the `ForEach` View :
                 */
                ForEach(expenses.list) { (item: ExpenseItem) in
                    return Text(item.name)
                }
                .onDelete(perform : removeItems)
            }
            .navigationTitle("iExpense")
            .navigationBarItems(trailing : Button(action : {
                let expenseItem = ExpenseItem(name : "Test Item" ,
                                              type : "Personal" ,
                                              amount : 5)
                expenses.list.append(expenseItem)
            } , label : {
                Image(systemName: "plus.circle")
                    .font(.largeTitle)
            }))
        }
    }
    
    
    
     // /////////////////////
    //  MARK: HELPER METHODS
    
    func removeItems(at offsets: IndexSet) {
        
        expenses.list.remove(atOffsets : offsets)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
