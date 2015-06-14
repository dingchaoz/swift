// Playground - noun: a place where people can play

import UIKit
//import Foundation

// Declare a protocol Speaker which is a list of methods
// that specify a contract or interface
// This protocol has an optional method thus must be prefixed with @objc
@objc protocol Speaker {
    
    // This protocol declares a signle method called Speak
    func Speak()
    
    // Prefix the method with the optional tag
    optional func TellJoke()
}

// Declare a claa that conforms to protocol Speaker

class Viki: Speaker {
    func Speak() {
        println("Hello I am Vicki")
    }
    
    func TellJoke() {
        println("Q; What did Sushi A say to Sushi B")
    }
}

// Declare a claa that conforms to protocol Speaker

class Ray: Speaker {
    func Speak() {
        println("Yo, I am Ray")
    }
    
    func TellJoke() {
        println("Q; What was the object-orientied way to become wealthy")
    }
    
    func WriteTutorial() {
        println("I'm on it")
    }
}
// Declare a class Animal
class Animal {
    
}

// Class dog inherits from class Animal and conform to protocol Speaker
class Dog: Animal, Speaker {
        func Speak() {
        println("Woof")
    }
}

var speaker: Speaker
speaker = Ray()
speaker.Speak()
(speaker as Ray).WriteTutorial()
speaker = Viki()
speaker.Speak()

speaker.TellJoke?()
speaker = Dog()
speaker.TellJoke?()

