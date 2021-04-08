//  DeletingItems.swift

import SwiftUI



struct DeletingItems: View {
    
    // ////////////////////////
   //  MARK: PROPERTY WRAPPERS
    
    @State private var numbers = Array<Int>()
    @State private var currentNumber: Int = 0
     
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        // STEP 4 of 5 :
        NavigationView {
            VStack {
                List {
                    // STEP 1 of 5 :
                    ForEach(numbers , id : \.self) { (number: Int) in
                        
                        return Text("\(number)")
                    }
                    // STEP 3 of 5 :
                    .onDelete(perform : removeRows )
                }
                Button(action : {
                    currentNumber += 1
                    numbers.append(currentNumber)
                } , label: {
                    Text("Add a Row")
                })
            }
            .navigationBarTitle(Text("Deleting Items"))
            // STEP 5 of 5 :
            .navigationBarItems(leading : EditButton())
        }
    }
    
    
    
     // //////////////
    //  MARK: METHODS
    
    // STEP 2 of 5
    func removeRows(at offsets: IndexSet) {
        
        numbers.remove(atOffsets : offsets)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct DeletingItems_Previews: PreviewProvider {
    
    static var previews: some View {
        
        DeletingItems()
    }
}
