# Better computational practice - Bad to better

This repository gives a demonstration of moving from bad, but runnable, code (see `bad`) to better code (see `better`). This is not intended to be a complete best practice example, but rather a demonstration of how to move from bad code to better code and some of the things to consider whilst doing so. We have suggested some exercises below to give some structure to looking through this repository:

## Why bother?

We all have a lot of code that is not well written. The reason this is true for all (or at least most) of us is that we are rarely given the time and resources to invest time in writing good code or to improve existing code. This is a problem because it can be hard to:

- Use
- Understand
- Maintain
- Extend
- Verify
- Reproduce results
- Generalise to new applications

## What is good code?

There are many definitions of good code, but for me the most important thing is that it should help us deal with all the issues above. In the rest of this document I will use the term "better" to refer to code that is better than the code in `bad` but not necessarily the best code possible.

## Before touching your keyboard

- Read the code in `bad` and think about what it might be doing and what could be wrong with it. Note down what you think it is doing and save it for later.

- What are some similarities between your code and the code in `bad`? What are some differences?

- What could have been done to make the code in `bad` easier to understand and use?

## Code organisation

One of the big issues with the code in `bad` is a lack of clear organisation. The code is all in one file and there are no comments to help the reader understand what is going on.

- Copy the contents of `bad` to a new folder called `a_bit_better`.

- Add some comments to `a_bit_better` to help the reader understand what is going on. Focus on identifying the core steps of the analysis and adding comments to help the reader understand what is going on at each step.

> Some tips for writing comments:
> - start by writing out “pseudocode”: plain language description of the process / steps of your work
> - given an overall picture (what + where), you can write down the details of
each larger step directly in the files
> - with the pseudocode in place, start writing the code by following that description; as you recognize additional detail needed to understand the code (or steps you forgot), expand your comments

- Move code into each analysis step into separate functions where possible (at the moment don't worry about making the functions work). This will help to make the code more readable and easier to understand. It can be a good idea to store these functions in their own folder (e.g. `bad/R`) to keep the code organised.

- Are the new names of these functions and files better (i.e. more clear) than the old names? If not, change them to fit the purpose of the function or file and their role in the analysis. Generally, easy to understand names are better than short names for making code easier to understand.

If you now look at `better` you should see that the code is organised into a number of files and has comments to help the reader understand what is going on. The code in `better` is also organised into a package so that it can be imported and used by other code (though perhaps not in this toy case). This can often be a good idea but is not a requirement for well organised code. How does this organisation differ from your solution? What do you think the trade-offs, if any, are between the two approaches?