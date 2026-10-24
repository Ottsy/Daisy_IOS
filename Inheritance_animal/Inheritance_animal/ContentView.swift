//
//  ContentView.swift
//  Inheritance_animal
//
//  Created by Daisy on 24/10/26.
//

import SwiftUI


// Animal
class Animal {
    var name: String
    var num_legs: Int
    var sound: String
    
    init(name: String, num_legs: Int, sound: String) {
        self.name = name
        self.sound = sound
        self.num_legs = num_legs
    }
    
    func makeSound() {
        print("\(name) says: \(sound)")
    }
    
}

// subclass: Dog
class Dog: Animal {
    init(name: String) {
        super.init(name: name, num_legs: 4, sound: "Gau gau !")
    }
    
    
}

//Cat
class Cat: Animal {
    init(name: String) {
        super.init(name: name, num_legs: 4, sound: "Meo meo")
    }
}

//Show
struct ContentView: View {
    var body: some View {
        Text("On screen")
            .onAppear {
                let myDog = Dog(name: "Lu")
                myDog.makeSound( )
                print("\(myDog.name) has \(myDog.num_legs) legs")
                
                let myCat = Cat(name: "Mun")
                myCat.makeSound( )
                print("\(myCat.name) has \(myCat.num_legs) legs")
                
            }
    }
}

