import Foundation
class PostfixCalculator {
  func parse(expression: String) throws -> Double {
      let input = expression.components(separatedBy: " ")
      var arr = [Double]()
      var a = 0.0
      var b = 0.0
      print(a)
      print("\n")
      print(b)
      if (input.count < 3) {
        throw PostfixCalculatorError.invalidExpression("Insuffient Operands")
      }
      for x in input{
          switch (x) {
          case "+":
              b = arr.removeFirst()
              if !arr.isEmpty {
                  a = arr.removeFirst()
              } else {
                  throw PostfixCalculatorError.invalidFormat("Invalid Format")
              }
              print(a)
              print("\n")
              print(b)
              arr.insert((a + b), at: 0)
          case "-":
                  b = arr.removeFirst()
              if !arr.isEmpty {
                  a = arr.removeFirst()
              } else {
                  throw PostfixCalculatorError.invalidFormat("Invalid Format")
              }
              arr.insert((a - b), at: 0)
          case "*":
              b = arr.removeFirst()
              if !arr.isEmpty {
                  a = arr.removeFirst()
              } else {
                  throw PostfixCalculatorError.invalidFormat("Invalid Format")
              }
              arr.insert((a * b), at: 0)
          case "/":
              b = arr.removeFirst()
              if !arr.isEmpty {
                  a = arr.removeFirst()
              } else {
                  throw PostfixCalculatorError.invalidFormat("Invalid Format")
              }
              arr.insert((a / b), at: 0)
          case "^":
              b = arr.removeFirst()
              if !arr.isEmpty {
                  a = arr.removeFirst()
              } else {
                  throw PostfixCalculatorError.invalidFormat("Invalid Format")
              }
              arr.insert((pow(a,b)), at: 0)
          default:
              if let check = Double(x) {
                  arr.insert(check, at: 0)
              } else {
                  throw PostfixCalculatorError.invalidOperator("Invalid Operator")
              }
          }
      }
      return arr.first!
  }
}

/*var a = 0.0
    var b = 0.0
    val arr = ArrayDeque<Double>()
    val str =  expression.split(" ")
    for (x in str) {
      if (x == "+") {
        b = arr.removeFirst()
        a = arr.removeFirst()
        arr.addFirst(a + b)
      }
      else if (x == "-") {
        b = arr.removeFirst()
        a = arr.removeFirst()
        arr.addFirst(a - b)
      }
      else if (x == "*") {
        b = arr.removeFirst()
        a = arr.removeFirst()
        arr.addFirst(a * b)
      }
      else if (x == "/") {
        b = arr.removeFirst()
        a = arr.removeFirst()
        arr.addFirst(a / b)
      }
      else if (x == "^") {
        b = arr.removeFirst()
        a = arr.removeFirst()
        arr.addFirst(a.pow(b))
      }
      else {
        arr.addFirst(x.toDouble())
      }
      }
    if (arr.size > 1) {
      println(arr)
      throw IllegalArgumentException("Illegal Argument, more numbers than operands")
    }
      return arr.first()

  }*/

