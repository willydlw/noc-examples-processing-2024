# The Nature of Code: Porting from p5.js to Processing

This repository is a collaborative effort to port the code examples from [Daniel Shiffman's book *The Nature of Code*](https://natureofcode.com/) from the JavaScript library **p5.js** to the **Processing** programming language.

## Repository Structure

The code examples are organized by chapters, starting from Chapter 0. Within each chapter, examples are numbered sequentially (e.g., `Example_0_1`, `Example_0_2`).  

```
/chapter0/
  Example_0_1/
  Example_0_2/
  ...
/chapter1/
  Example_1_1/
  Example_1_2/
  ...
```

Each example is contained in its respective folder to make navigation straightforward.
The names of the main sketche files should be the same as the folder they are in

## Porting Example

To see how the first example in the book was ported (Example_0_1) by Dan, check out [this livestream](https://www.youtube.com/live/qNqKeMa9yBU?si=kevmtdfZMXmcXi2N&t=3218).

## Contribution Guidelines

We welcome contributions from the community! If you'd like to help port examples to Processing, please follow these guidelines:

1. Ensure the ported code adheres to Processing's syntax yet stays in the same style conventions.
2. Keep the functionality and code structure as close to the original p5.js example as possible.
3. Test your code to ensure it runs properly in Processing.
4. Make sure to change window size from (640,240) -> (640,360) and make sure everything is still centered and looks correct in the new window size
5. Replace the p5.js function `createP()` to the Processing function `println()`

all the code examples are available in the [*The Nature of Code* Website](https://natureofcode.com/).

Feel free to open a pull request or raise an issue if you have questions or suggestions!
