#!/usr/bin/swift

//DL note: copied excerpts from ColonRule.swift; added comments in () parentheses 

import Foundation

var spacingRegex = "\\s"

 let regexExpandedString = "(\\w)" +           // Capture an identifier (an alphanumeric character or underscore)
		            "(?:" +         //    start group (non-capturing)
		            "\\s+" +        // followed by whitespace
		            ":" +           // to the left of a colon
		            "\\s*" +        // followed by any amount of whitespace.
		            "|" +           // or
		            ":" +           // immediately followed by a colon
		            spacingRegex +  // followed by right spacing regex
		            ")" +           //    end group
		            "(" +           //    Capture a type identifier
		            "[\\[|\\(]*" +  // which may begin with a series of nested parenthesis or brackets
		       		 "\\S)"          // lazily to the first non-whitespace character, and end the capture group


//(this is the regex, compressed to a line)
let regexPattern =  "(\\w)(?:\\s+:\\s*|:\\s)([\\[|\\(]*\\S)"


// (examples are from non-triggering examples list)
let simpleExample = "let abc: Void"

let complexExample = "let abc: [([Void], String, Int)]\n"

let breakingExample = "func baz(lhs: Int, rhs: Int) -> Bool {\n" +
		        		"typealias Type = FooBar\n" +
		        		"return lhs > rhs ? Type.foo : Type.bar\n" +
		        		"}"



let regex = try! NSRegularExpression(pattern: regexPattern,
                                         options: .caseInsensitive)
let matches = regex.matches(in: simpleExample, options: [], range: NSMakeRange(0, simpleExample.utf16.count))

print(matches.count)

