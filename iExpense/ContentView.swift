// MARK:  ContentView.swift

import SwiftUI



 // //////////////////////////////////
//  MARK: struct ContentView: View { }

struct ContentView: View {
    
     // /////////////////
    //  MARK: PROPERTIES
    
    @State private var numbersArray = Array<Int>()
    @State private var currentNumber: Int = 1
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        NavigationView { // Deleting items from a list : STEP 4 of 5
            VStack {
                List {
                    /**
                     `GOTCHA` : The `onDelete()` modifier only exists on `ForEach` ,
                     so if we want users to delete items from a list
                     we must put the items inside a `ForEach` .
                     */
                    ForEach(numbersArray , id : \.self) { (number: Int) in
                        Text("\(number)")
                    } // Deleting items from a list : STEP 1 of 5
                    .onDelete(perform : removeRows) // Deleting items from a list : STEP 3 of 5
                }
                Button(action : { () -> Void in
                    numbersArray.append(currentNumber)
                    currentNumber += 1
                    
                } , label : {
                    Text("Add Row")
                })
            }
            .navigationBarItems(trailing: EditButton()) // Deleting items from a list : STEP 5 of 5
        }
    }
    
    
     // ////////////////////
    //  MARK: HELPERMETHODS
    
    func removeRows(at offsets: IndexSet) {
        
        numbersArray.remove(atOffsets : offsets)
    } // Deleting items from a list : STEP 2 of 5
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().previewDevice("iPhone 12 Pro")
    }
}
