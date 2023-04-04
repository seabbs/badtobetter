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

- Copy the contents of `bad` to a new folder called `better_for_me`.

- Add some comments to `better_for_me` to help the reader understand what is going on. Focus on identifying the core steps of the analysis and adding comments to help the reader understand what is going on at each step.

> Some tips for writing comments:
> - start by writing out “pseudocode”: plain language description of the process / steps of your work
> - given an overall picture (what + where), you can write down the details of
each larger step directly in the files
> - with the pseudocode in place, start writing the code by following that description; as you recognize additional detail needed to understand the code (or steps you forgot), expand your comments

- Move code into each analysis step into separate functions where possible (at the moment don't worry about making the functions work). This will help to make the code more readable and easier to understand. It can be a good idea to store these functions in their own folder (e.g. `bad/R`) to keep the code organised.

- Take any other organisational steps you think would help to make the code easier to understand and use but don't worry about making the code work or about spending to long on this step.

> If you now look at `better` you should see that the code is organised into a number of files and has comments to help the reader understand what is going on. The code in `better` is also organised into a package so that it can be imported and used by other code (though perhaps not in this toy case). This can often be a good idea but is not a requirement for well organised code. How does this organisation differ from your solution? What do you think the trade-offs, if any, are between the two approaches?

- Now how would you summarise what the code is doing? Does this answer differ from your initial thoughts? If so, why do you think this is?

## Making your code functional

You should now have a better understanding of what the code in `bad` is doing and how it is organised. The next step is to make the code work. This will involve going through your code from beginning to end and making sure each function you have created is supplied with the inputs required in the code (and that these are specified in the function definition) and that the outputs of each function are used in the next step of the analysis.

> If you get stuck at any point, look at the code in `better` to see how it works but remember that this is not the only way to do things.

You should now be able to run your code and reproduce `bad/figure.png`. If you have done this, congratulations! You have now made your code functional.

## Code style

Code style is a very subjective topic and there are many different opinions on what makes good code. In this section we will look at some of the things that I have found useful for making code easier for me to understand. Whilst not universal best practices in general most people agree that they are good practice.

- **Clear Function and file names.** Are the new names of these functions and files better (i.e. more clear) than the old names? If not, change them to fit the purpose of the function or file and their role in the analysis. Generally, easy to understand names are better than short names for making code easier to understand.

- **Whitespace.** Code is for you as well as the machine, using blank space effectively can help you read the code by indicating distinct sections of code (corresponding to distinct sub-steps), making declaration / assignment clearer, and by emphasizing evaluation blocks (versus debugging blocks). In general following standard whitespace conventions is a good idea as it makes it easier for others to read your code (and for those with automated tools on their machine this way your code won't through 100s of warnings!). Go through your code in `better_for_me` and add whitespace where you think it would help to make the code easier to read.

- **Variable names.** Are the variable names in your code clear and descriptive? If not, change them to be more descriptive. In general, long variable names are better than short variable names for making code easier to understand. In R, we generally favour lower case variable names with underscores to separate words (e.g. `my_variable_name`). Sticking to this practice can make your code easier to read.

- **DRY.** DRY stands for "Don't Repeat Yourself". This is a principle of software development that states that you should not repeat yourself in your code. This is a good principle to follow as it makes your code easier to maintain and reduces the chance of errors. Go through your code in `better_for_me` and see if you can reduce the amount of repeated code.

## Exploring `better`

You should now have a functional version of `bad` that is much easier to understand and use. However, learning best practices is a long road and there is always more to learn. If you are interested in learning more, you can explore the code in `better` to see some of the approaches we have taken. In particular, you might want to thing about how we have set everything up for the single country case and then generalised with more advanced tools. This approach is often your friend for breaking down complex problems.

## Contributing and feedback

If you have any feedback or suggestions for improvements, please feel free to open an issue or pull request on the [GitHub repository](https://github.com/seabbs/badtobetter).