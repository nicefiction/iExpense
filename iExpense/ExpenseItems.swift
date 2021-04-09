//  ExpenseItems.swift

import Foundation



class ExpenseItems: ObservableObject {
    
    @Published var list = Array<ExpenseItem>() {
        /**
         `NOTE` : The  `didSet` property observer on the `list` property of Expenses ,
         writes out changes  whenever an item gets added or removed :
         */
        didSet {
            let encoder = JSONEncoder()
            
            if let _encoded = try? encoder.encode(list) {
                UserDefaults.standard.setValue(_encoded ,
                                               forKey : "Items")
            }
        }
    }
    
    
    init() {
        if let _list = UserDefaults.standard.data(forKey: "Items") {
            
            let decoder = JSONDecoder()
            
            if let _decoded = try? decoder.decode([ExpenseItem].self , from : _list) {
                /**
                 To say that we mean we are referring to the type itself , known as the _type object_  – we write `.self` after it .
                 */
                self.list = _decoded
                return
            }
        }
        self.list = []
    }
}
