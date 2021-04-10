// MARK:  ContentView.swift

import SwiftUI



struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @ObservedObject var expenses = ExpenseItems()
    
    @State private var isShowingAddExpenseItemView: Bool = false
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView {
            VStack { // ⚠️ OLIVIER : You need a VStack to make the EditButton() display the icons when in Edit mode .
                List {
                    // ForEach(expenses.list , id : \.name) { (item: ExpenseItem) in
                    /**
                     Because `ExpenseItem` conforms to the `Identifiable` protocol
                     and has `id: UUID = UUID()` implemented ,
                     we no longer need to write `id : \.name` in the `ForEach` View .
                     `ForEach`knows there will be an `id` property
                     and that it will be unique ,
                     because that is the point of the `Identifiable` protocol :
                     */
                    ForEach(expenses.list) { (item: ExpenseItem) in
                        // return Text(item.name)
                        HStack {
                            VStack(alignment : .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("$ \(item.amount)")
                                .font(.title)
                                .padding(.horizontal)
                        }
                    }
                    .onDelete(perform : removeItems)
                }
            }
            .navigationTitle("iExpense")
            .navigationBarItems(
                leading : EditButton() ,
                trailing : Button(action : {
                    isShowingAddExpenseItemView.toggle()
                } , label : {
                    Text("Add Expense Item")
                })
            )
            .sheet(isPresented : $isShowingAddExpenseItemView) {
                AddExpenseItem(expenseItems : self.expenses)
            }
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
