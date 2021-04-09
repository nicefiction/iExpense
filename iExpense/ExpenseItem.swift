//  ExpenseItem.swift

import Foundation



struct ExpenseItem: Identifiable ,
                    Codable {
    
    var id: UUID = UUID() // Swift generates a UUID automatically for us .
    var name: String
    var type: String
    var amount: Int
}
