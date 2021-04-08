//  ArchivingObjectsWithCodable.swift
// SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/archiving-swift-objects-with-codable
/**
 UserDefaults is great for storing simple settings such as integers and Booleans ,
 but when it comes to complex data – custom Swift types , for example –
 we need to do a little more work .
 We want to archive a custom type
 so we can put it into `UserDefaults` ,
 then unarchive it when it comes back out from `UserDefaults` .
 Swift will automatically generate some code for us
 that will archive and unarchive User instances for us as needed ,
 but we still need to tell Swift
 _when_ to archive
 and _what to do_ with the data :
 */

import SwiftUI


struct User: Codable {
    
    var firstName: String
    var lastName: String
}





struct ArchivingObjectsWithCodable: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var user: User = User(firstName : "Dorothy" ,
                                         lastName : "Gale")
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack(spacing : 20) {
            Text("\(user.firstName) \(user.lastName)")
                .font(.title)
            
            /* Creates a button that archives the user
             * and saves it to UserDefaults :
             */
            Button("Save User") {
                let encoder = JSONEncoder()
                
                if let _data = try? encoder.encode(self.user) {
                    UserDefaults.standard.set(_data ,
                                              forKey: "UserData")
                }
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ArchivingObjectsWithCodable_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ArchivingObjectsWithCodable()
    }
}
