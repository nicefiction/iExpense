//  ExpenseItems.swift

import Foundation



class ExpenseItems: ObservableObject {
    
    @Published var list = Array<ExpenseItem>()
}
