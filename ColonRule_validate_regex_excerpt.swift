#!/usr/bin/swift

//DL note: copied excerpts from ColonRule.swift; added comments in () parentheses

import Foundation

let spacingRegex = "\\s"

//(this is the regex, compressed to a line)
let regexString =  "(\\w)(?:\\s+:\\s*|:" + spacingRegex + ")([\\[|\\(]*\\S)"
let regex = try! NSRegularExpression(pattern: regexString)

let regex = try! NSRegularExpression(pattern: "(\\w)(?:\\s+:\\s*|\s:)([\\[|\\(]*\\S)")


// (examples are from non-triggering examples list)
let simpleExample = "let abc: Void"

let complexExample = "let abc: [([Void], String, Int)]\n"

let breakingExample = "func baz(lhs: Int, rhs: Int) -> Bool {\n" +
    "typealias Type = FooBar\n" +
    "return lhs > rhs ? Type.foo : Type.bar\n" +
    "}"
