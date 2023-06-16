/*
 * Copyright (C) 2022-2023 David C. Harrison. All right reserved.
 *
 * You may not use, distribute, publish, or modify this code without
 * the express written permission of the copyright holder.
 */

export default class {
  /**
   * @param {String} expression Postfix expression
   * @return {Number} result of evaluating expression
   * @throws
   */

  static evaluate(expression) {
    let input = expression.trim().replace(/\s\s+/g, ' ').split(' ');
    console.log(input);
    let arr = [];
    let a = 0.0;
    let b = 0.0;
    //  console.log(a);
    //   console.log("\n");
    //   console.log(b);

    for (let x of input) {
      switch (x) {
        case '+':
          b = arr.shift();
          if (arr.length > 0) {
            a = arr.shift();
          } else {
            throw 'Invalid Expression';
          }
          arr.unshift(a + b);
          break;
        case '-':
          b = arr.shift();
          a = arr.shift();

          arr.unshift(a - b);
          break;
        case '*':
          b = arr.shift();
          a = arr.shift();
          arr.unshift(a * b);
          break;
        case '/':
          b = arr.shift();
          a = arr.shift();
          arr.unshift(a / b);
          break;
        case '^':
          b = arr.shift();
          a = arr.shift();
          arr.unshift(Math.pow(a, b));
          break;
        default:
          let check = parseFloat(x);
          if (!isNaN(check)) {
            arr.unshift(check);
          } else {
            throw 'Unknown Operator';
          }
      }
    }
    return arr[0];
  }
}
