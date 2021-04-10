//  ExpenseItems.swift

import Foundation



class ExpenseItems: ObservableObject {
    
    @Published var list = Array<ExpenseItem>() {
        
        didSet {
            // The  didSet property observer on the list property of Expenses , writes out changes whenever an item gets added or removed :
            let encoder = JSONEncoder()
            
            if let _encoded = try? encoder.encode(list) {
                UserDefaults.standard.setValue(_encoded ,
                                               forKey : "Items")
            }
        }
    }
    
    /**
     `STEP 1` : Attempt to read the “Items” key from UserDefaults .
     `STEP 2` : Create an instance of JSONDecoder — which is the counterpart of JSONEncoder — that lets us go from JSON data to Swift objects .
     `STEP 3` : Ask the decoder to convert the data we received from UserDefaults into an array of `ExpenseItem` objects .
              `NOTE`: To say that we mean we are referring to the type itself , known as the _type object_  – we write `.self` after it .
     `STEP 4` : If that worked , assign the resulting array to items and exit .
     `STEP 5` : Otherwise , set items to be an empty array .
     
     `SOURCE`: https://www.hackingwithswift.com/books/ios-swiftui/making-changes-permanent-with-userdefaults
     */
    
    init() {
        if let _list = UserDefaults.standard.data(forKey: "Items") { // STEP 1
            
            let decoder = JSONDecoder() // STEP 2
            
            if let _decoded = try? decoder.decode([ExpenseItem].self , from : _list) { // STEP 3
                
                self.list = _decoded // STEP 4A
                return // STEP 4B
            }
        }
        self.list = [] // STEP 5
    }
}
