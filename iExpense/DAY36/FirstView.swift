// MARK: FirstView.swift

import SwiftUI



struct FirstView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var isShowingSecondView: Bool = false
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        Button("Show Second View") {
            isShowingSecondView.toggle()
        }
        .sheet(isPresented : $isShowingSecondView) {
            SecondView(name : "Dahlia")
        }
    }
}





 // //////////////
// MARK: PREVIEWS

struct FirstView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FirstView()
    }
}
