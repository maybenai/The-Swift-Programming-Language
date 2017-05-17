//: Playground - noun: a place where people can play

import UIKit

/*
 错误处理是响应错误以及从错误中恢复的过程。
 某些操作无法保证总是执行完所有代码或总是生成游泳的结果。可选类型可用来表示值缺失，但是当某个操作失败时，最好能得知失败的原因，从而可以作出相应的应对。
 */


/*
 表示并抛出错误
 在Swift中，错误用符合Error协议的类型的值来表示。这个空协议表明该类型可以用于错误处理
 
 在Swift的枚举类型尤为适合构建一组相关的错误状态，枚举的关联值还可以提供错误状态的额外信息。
 */


enum VendingMachineError: Error {
    case invalidSelection   //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock         //缺货
}

//抛出一个错误可以让你表妹有意外情况发生，导致正常的执行流程无法继续执行。抛出错误使用throw关键字

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)



/*
 处理错误
 某个错误被抛出时，附近的某部分代码必须负责处理这个错误
 
 Swift中有4种处理错误的方式。你可以把函数抛出的错误传递给调用此函数的代码、用do-catch语句处理错误、将错误作为可选类型处理、或者断言此错误根本不会发生
 */

//用throwing函数传递错误: 为了表示一个函数、方法或构造器可以抛出错误，在函数声明的参数列表之后加上throws关键字。一个标有throws关键字的函数被称作throwing函数。如果这个函数指明了返回值类型，throws关键词需要写在箭头(->)的前面。只有throwing函数可以传递错误。任何在某个非throwing函数内部抛出的错误只能在函数内部处理。

struct Item {
    var price: Int
    var count: Int

}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
        
    }
    
}


let vendingMachine = VendingMachine()

try vendingMachine.vend(itemNamed: "ship")

/*
 用Do-Catch处理错误
 可以使用一个do-catch语句运行一段闭包代码来处理错误。
 */

do {
    try vendingMachine.vend(itemNamed: "ship")
} catch VendingMachineError.outOfStock {
    print("outOfStock")
} catch VendingMachineError.invalidSelection {
    print("invalidSelection")
}


/*
 将错误转成可选值
 可以使用try?通过将错误转换成一个可选值来处理错误。如果在评估try?表达式时一个错误被抛出，那么表达式的值就是nil
 */

/*
 禁用错误传递
 有时你知道某个throwing函数实际上在运行时是不会抛出错误的，在这种情况下，你可以在表达式前面写try!来禁用错误传递，这回把调用包装在一个不会有错误抛出的运行时断言中。如果真的抛出了错误，你会得到一个运行时错误。
 */



