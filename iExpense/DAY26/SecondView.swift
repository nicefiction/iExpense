// MARK: SecondView.swift

import SwiftUI



 // //////////////////////////////////
//  MARK: struct SecondView: View { }

struct SecondView: View {   
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @Environment(\.presentationMode) var presentationMode
    /**
     `@Environment` allows us to create properties
     that store values
     provided to us
     externally :
     _Is the user in light mode or dark mode ?_
     _Have they asked for smaller or larger fonts ?_
     _What timezone are they on ?_
     All these and more are values that come from the environment ,
     and in this instance
     we are going to read our view’s _presentation mode_ from the _environment_.
     The presentation mode of a view contains only two pieces of data ,
     but both are useful :
     a property storing whether the view is currently presented on screen ,
     and a method to let us dismiss the view immediately .
     */
    
     // /////////////////
    //  MARK: PROPERTIES
    
    var name: String
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Hello \(name)")
                .font(.title)
            Spacer()
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
                /**
                 `NOTE` : The addition of `wrappedValue` in there is required ,
                 because `presentationMode` is actually a _binding_
                 so it can be updated automatically by the system .
                 */
            }
        }
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct SecondView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SecondView(name : "Dorothy")
    }
}
