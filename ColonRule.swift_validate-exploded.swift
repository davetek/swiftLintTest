#!/usr/bin/swift

//DL note: copied excerpts from ColonRule.swift; added comments in () parentheses 

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
let regexString =  "(\\w)(?:\\s+:\\s*|:" + spacingRegex + ")([\\[|\\(]*\\S)"
let regex = try! NSRegularExpression(pattern: regexString)


// (examples are from non-triggering examples list)
let simpleExample = "let abc: Void"

let complexExample = "let abc: [([Void], String, Int)]\n"

let breakingExample = "func baz(lhs: Int, rhs: Int) -> Bool {
		        		typealias Type = FooBar
		        		return lhs > rhs ? Type.foo : Type.bar
		    			}"
