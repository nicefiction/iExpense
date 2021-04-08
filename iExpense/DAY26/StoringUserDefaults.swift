//  UserDefaults.swift

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

/*
 Button(action : {
     tapCount += 1
     UserDefaults.standard.set(self.tapCount ,
                               forKey : "Tap")
 } , label : {
     Text("Tap Count : \(tapCount)")
 })
 */



struct StoringUserDefaults_Previews: PreviewProvider {
    
    static var previews: some View {
        
        StoringUserDefaults()
    }
}
