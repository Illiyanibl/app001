protocol CalculatorGameProtocol {
    func checkResult(userResult: Int,  trueResult: Int) -> Bool
}

extension CalculatorGameProtocol {
    func checkResult(userResult: Int,  trueResult: Int) -> Bool { return userResult == trueResult ?  true : false }
}


class CalculaturGame: CalculatorGameProtocol {
    var startResult = Int.random(in: 1...50)
    lazy var historyOfResult: [Int] = [startResult]
    func play() {
        var operation: Int = 0
        if historyOfResult[historyOfResult.count - 1] < 26 {
            operation = Int.random(in: 2...3)
        } else if historyOfResult[(historyOfResult.count - 1)] < 51 {
            operation = Int.random(in: 1...2)
        } else {
            operation = 1
        }

        var operand: Int = 0
        if operation == 3 {
            operand = Int.random(in: 2...3)
        } else {
            operand = Int.random(in: 1...25)
        }
        var operationSymbol: String = ""
        var trueResult = 0
        if operation == 3 {
            operationSymbol = "*"
            trueResult = historyOfResult[historyOfResult.count - 1] * operand
        }
        if operation == 2 {
            operationSymbol = "+"
            trueResult = historyOfResult[historyOfResult.count - 1] + operand
        }
        if operation == 1 {
            operationSymbol = "-"
            trueResult = historyOfResult[historyOfResult.count - 1] - operand
        }
        var userResult = Int.random(in: 20...50)
        if historyOfResult.count < 10 {
            userResult = trueResult
        }
        print("\(historyOfResult[historyOfResult.count - 1]) \(operationSymbol) \(operand) = \(userResult)")
        historyOfResult.append(trueResult)
        if checkResult(userResult: userResult, trueResult: trueResult) {
            self.play()
        } else {
            print("не верно, а в ерный резултат \(trueResult). Конец игры!")
        }
    }
}
let play = CalculaturGame()
play.play()
