// MARK: HumanView.swift

import SwiftUI



 // ///////////////////////////////
//  MARK: struct HumanView: View {

struct HumanView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    // @State private var human: Human = Human()
    @ObservedObject var human: Human = Human() // Implementing the Observable protocol : STEP 3 of 3
    /**
     `NOTE` : I have removed the `private` access control there ,
     but whether or not you use it depends on your usage
     – if you are intending to share that object with other views
     then marking it as `private` will just cause confusion .
     */
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        VStack {
            Text("My name is")
            Text("\(human.firstName) \(human.lastName)")
                .font(.largeTitle)
            Spacer()
            HStack {
                Text("First name :")
                    .foregroundColor(.gray)
                TextField("My first name" ,
                          text : $human.firstName)
            }
            HStack {
                Text("Last name :")
                    .foregroundColor(.gray)
                TextField("My last name" ,
                          text : $human.lastName)
            }
            Spacer()
        }
        .padding()
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct HumanView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HumanView().previewDevice("iPhone 12 Pro")
    }
}
