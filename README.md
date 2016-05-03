# CS 190 Problem Set #10&mdash;Exception Handling

[Course Home Page]( http://physics.stmarys-ca.edu/classes/CS190_S16/index.html )

Due: Tuesday, May 10th, 2016.

## Reference for this Week's Material

Apple's [Swift 2.2 Book]( https://itunes.apple.com/us/book-series/swift-programming-series/id888896989 ) has a Chapter titled "Error Handling".

## Directions Specific to this Problem Set

The iPhone app in this project just reads a plist from a file and then puts its title in a view called "Title View Controller".

There are four plists it can try to read:

 * The first one is the "good" one.
 * The second is a well-formed property list. However, the property list doesn't have a title.
 * The third one is malformed.
 * The fourth is nonexistent.

I wrote some a function called titleForPlist that throws an exception in the latter three cases.

1. (5 pts) Create a place in the "Title View Controller" where you can show an error message to the user. Make the text of the error message red. Make sure the error message doesn't appear at all&mdash;not even as an empty box&mdash;when there is no error (HINT: UIView has a hidden attribute).

2. (5 pts) Find the code in TableViewController.swift that calls titleForPlist. Modify prepareForSegue to use what you did in Part 1 to show an appropriate error message to the user whenever an exception is thrown. The error message should explain to the user what is wrong in each of the three cases.

## General Directions for all Problem Sets

1. Fork this repository to create a repository in your own Github account. Then clone your fork to whatever machine you are working on.

2. These problem sets are created with the latest version of Xcode and Mac OS X: Xcode 7.3 and OS X 10.11.4. I haven't tested how well this problem set will work under Xcode 7.2.1. Please go into Galileo 205, 206 or 208 and test your work rather than relying on the Xcode 7.2.1 machines in Garaventa.

3. Under no circumstances copy-and-paste any part of a solution from another student in the class. Also, under no circumstances ask outsiders on Stack Exchange or other programmers' forums to help you create your solution. It is however fine&mdash;especially when you are truly stuck&mdash;to ask others to help you with your solution, provided you do all of the typing. They should only be looking over your shoulder and commenting. It is of course also fine to peruse StackExchange and whatever other resources you find helfpul.

4. Your solution should be clean and exhibit good style. At minimum, Xcode should not flag warnings of any kind. Your style should match Apple's as shown by their examples and declarations. Use the same indentation and spacing around operators as Apple uses. Use their capitalization conventions. Use parts of speech and grammatical number the same way as Apple does. Use descriptive names for variables. Avoid acronyms or abbreviations. I am still coming up to speed on good Swift style. When there appears to be conflict my style and Apple's, copy Apple's, not mine.

5. When completed, before the class the problem set is due, commit your changes to your fork of the repository. I should be able to simply clone your fork, build it and execute it in my environment without encountering any warnings, adding any dependencies or making any modifications.
