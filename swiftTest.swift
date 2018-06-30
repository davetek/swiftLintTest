#!/usr/bin/swift

struct FooBar {
    
    var stuff: [String: String] = ["a": "apple", "k": "kiwi", "m": "mango"]
    
    static let foo = true
    static let bar = false

    //as a comparison, the following function w/o typealias does NOT trigger the colon rule 
    func bazNoAlias(lhs: Int, rhs: Int) -> Bool {
    	return lhs > rhs ? FooBar.foo : FooBar.bar
    }

    func baz(lhs: Int, rhs: Int) -> Bool {
        typealias Type = FooBar
        return lhs > rhs ? Type.foo : Type.bar
    }
}