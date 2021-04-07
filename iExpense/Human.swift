//  Human.swift

import Foundation

/**
 `SOURCE : https://www.hackingwithswift.com/books/ios-swiftui/sharing-swiftui-state-with-observedobject`
 
 If you want to use a class with your SwiftUI data
 – which you will want to do if that data should be shared across more than one view –
 then SwiftUI gives us two property wrappers that are usefu l:
 `@ObservedObject` and `@EnvironmentObject` .
 We’ll be looking at environment objects later on ,
 but for now let’s focus on observed objects .
 
 There are `3 STEPS`:
 
 `STEP 1`  : Make a class that conforms to the `ObservableObject` protocol .
 `STEP 2`  : Mark some properties with `@Published`
           so that any views using the class get updated when they change .
 `STEP 3`  : Create an instance of our class using the `@ObservedObject` property wrapper .
 
 The end result is
 that we can have our state stored in an external object ,
 and , even better ,
 we can now use that object in multiple views
 and have them all point to the same values .
 */


// struct Human {
// class Human {
class Human: ObservableObject { // STEP 1 of 3
    
    // var firstName: String = "Dorothy"
    @Published var firstName: String = "Dorothy" // STEP 2 of 3
    // var lastName: String = "Gale"
    @Published var lastName: String = "Gale"
}


/**
 `NOTE` OLIVIER :
 DAY 26
 https://www.hackingwithswift.com/books/ios-swiftui/why-state-only-works-with-structs
 For this example to work
 — seeing the difference between using Human as a class and struct —
 you need to run the app in the simulator .
 The change has no effect if you use the Canvas .
 What you should notice is that once you change Human to a class ,
 typing in the TextField does not change the name in the Text view .
 */
