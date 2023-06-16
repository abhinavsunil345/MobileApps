import Foundation

enum PostfixCalculatorError: Error {
  case notImplemented(String)
  case invalidOperator(String)
  case invalidExpression(String)
  case invalidFormat(String)
}
