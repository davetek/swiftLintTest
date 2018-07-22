## Analysis of SwiftLint

### Overview
I am conducting this analysis as part of my effort to contribute to this open-source project, initially by troubleshooting and fixing issue #1277. This issue deals with ColonRule.

### Analysis Method 1

I used the Xcode 'Related Items' tool and text searches to trace the execution of the 'validate' function of ColonRule back to main.swift, which starts SwiftLint when the command to start the program is entered on the command line.

1. Find the caller of the function / constructed variable, using the techniques below, listed in order of preference.
    a. Click on the function or constructed variable name, and then select the Related Items icon in the upper left corner of the code editor. If the Callers items is enabled, look at the callers list and select one or more to determine which is the most logical caller for the process you are tracing.
    b. Press Cmd + 4 to look for instances of the function / variable name in all source files. Enter the function / variable name as it would be called, for example '.foo('
    c. Press Cmd + f to look for instances of the function / variable name in the current source file. Enter the function / variable name as it would be called, for example '.foo('
    d. Check the protocols adopted by the type that contains the function or variable; specifically, check any extensions which may be implemented to call the function / construct the variable.

2. Repeat step 1 for the function / constructed variable discovered in step 1.

### Analysis Method 2

One can also place a breakpoint at the item of interest, and then build/run the project. Select the Debug navigator (tab 7) to see the list of threads; one ends on the item at the breakpoint.


### Process Analysis

1. Start with validate(file: File), line 167 in ColonRule.swift.

