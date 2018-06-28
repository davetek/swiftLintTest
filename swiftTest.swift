#!/usr/bin/swift

struct FooBar {
    
    var stuff: [String: String] = ["a" : "apple", "k": "kiwi", "j": "jackfruit"]
    
    static let foo = true
    static let bar = false
    
    func baz(lhs: Int, rhs : Int) -> Bool {
        typealias Type = FooBar
        return lhs > rhs ? Type.foo : Type.bar
    }
}