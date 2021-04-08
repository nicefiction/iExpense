//  UserDefaults.swift
// Source : https://www.hackingwithswift.com/books/ios-swiftui/storing-user-settings-with-userdefaults
/**
 `UserDefaults` is perfect for
 storing user settings
 and other important data
 – you might track when the user last launched the app ,
 which news story they last read ,
 or other passively collected information .
 */

import SwiftUI



struct StoringUserDefaults: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    // @State private var tapCount: Int = 0
    @State private var tapCount: Int = UserDefaults.standard.integer(forKey : "Tap")
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Button(action: {
            tapCount += 1
            UserDefaults.standard.set(self.tapCount ,
                                      forKey : "Tap")
        } , label : {
            Text("Tap Count : \(tapCount)")
        })
    }
}





struct StoringUserDefaults_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StoringUserDefaults()
    }
}
