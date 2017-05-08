//: Playground - noun: a place where people can play

import UIKit

/*
 闭包是自包含的函数代码块，可以在代码中被传递和使用。
 闭包可以捕获和存储其所在上下问中任意常量和变量的引用。被称为包裹常量和变量。
 
 在函数章节中介绍的全局和嵌套函数世纪上也是特殊的闭包，闭包采取如下三种形式之一：
 1.全局函数是一个又名字但不会捕获任何值的闭包
 2.嵌套函数是一个又名字并可以捕获其封闭函数域内值的闭包
 3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量和常量值的匿名闭包
 
 Swift的闭包表达式拥有简洁的风格，并鼓励在常见场景中进行语法优化，主要优化如下：
 1.利用上下文推断参数和返回类型
 2.隐式返回单表达式闭包，即单表达式闭包可以省略return关键字
 3.参数名称缩写
 4.尾随闭包语法
 
 闭包的表达式：
 嵌套函数是一个较复杂函数中方便进行命名和定义自包含代码模块的方式。当然，有时候编写小巧的没有完整定义和命名的类函数结构也是很有用处的，尤其是在处理一些函数并需要将另外一个函数作为该函数的参数时。
 
 闭包表达式是一种利用简介语法构建内联闭包的方式。闭包表达式提供了一些语法优化，使得撰写闭包变得简单明了。
 */

//sorted方法: 它会根据你所提供的用于排序的表函数将已知类型数组中的值进行排序

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

//如果第一个字符串(s1)大于第二个字符串(s2)， backward(_:_:)函数会返回true，表示在新的数组中s1应该出现s2之前。对于字符串中的字符来说，“大于”表示按照字母顺序较晚出现。该闭包将进行字母逆序排序。


//闭包表达式语法 ： 如下的一般格式

    /*
{ (<#parameters#>) -> <#return type#> in
    <#statements#>
}
*/

//闭包表达式参数可以是in-out参数，单不能设定默认值。也可以使用具名的可变参数。元组也可以作为参数和返回值。


reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

//闭包的函数体部分由关键字in引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始

reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})



//根据上下文推断类型
//因为排序闭包函数是作为sorted(bg:)方法的参数传入的，Swift可以推断其参数和返回值的类型。sorted(by:)方法被一个字符串数组调用，因此其参数必须是(String,String) -> Bool 类型的函数。这意味着(String,String)和Bool类型并不需要座位闭包表达式定义的一部分。因为所有的类型都可以被推断出来，返回箭头->和围绕在参数周围的括号也可以省略


reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})



//单表达式闭包隐式返回
//单行表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})


//参数名称缩写: Swift自动为内联闭包提供了参数名称缩写功能，你可以直接通过$0,$1,$2来顺序调用闭包的参数，以此类推。 如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成
reversedNames = names.sorted(by: {$0 > $1})


//运算符方法   实际上还有一种更简短的方式来编写上面例子中的闭包表达式。Swift的String类型定义了关于大于号>的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值。而这正好与sorted(by:)方法的参数需要的函数类型相符合。因此，可以简单的传递一个大于号，Swift可以自动推断出你想使用大于号的字符串实现
reversedNames = names.sorted(by: >)


//尾随闭包 : 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为作为最后一个参数调用。在使用尾随闭包时，不用写出它的参数标签

func someFunctionThatTakesAClosure(closure: () -> Void) {
    //函数体部分
}

//以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure (closure: {

})

//以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure () {
    //闭包主体部分
}

reversedNames = names.sorted(){$0 > $1}

reversedNames = names.sorted{$0 > $1}


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16,58,510]

let strings = numbers.map {
    (number) -> String in
    
    var number = number
    
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}


//值捕获   闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内饮用和修改这些值。   Swift中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数，嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。

//举个例子，这有一个叫做 makeIncrementer 的函数，其包含了一个叫做 incrementer 的嵌套函数。嵌套函数 incrementer() 从上下文中捕获了两个值，runningTotal 和 amount。捕获这些值之后，makeIncrementer 将 incrementer 作为闭包返回。每次调用 incrementer 时，其会以 amount 作为增量增加 runningTotal 的值。

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}



//闭包是引用类型: 无论是将函数或闭包赋值给一个常量还是变量，实际上都是将常量或变量的值设置为对应函数或闭包的引用，这意味着如果你讲闭包赋值给了两个不同的常量或变量，两个值会指向同一个闭包



//逃逸闭包： 当一个闭包作为参数传到一个函数中，但是这个闭包仔函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，可以在参数名之前标注@escaping，用来指明这个闭包是允许“逃逸”出这个函数的    一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。


var completionHanlers: [() -> Void] = []

func someFunctionWithEsacpingClosure(completionHandler: @escaping() -> Void) {
    completionHanlers.append(completionHandler)
}
//someFunctionWithEscapingClosure(_:) 函数接受一个闭包作为参数，该闭包被添加到一个函数外定义的数组中。如果你不将这个参数标记为 @escaping，就会得到一个编译错误。
//将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。


//自动闭包： 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包部接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)


let customerProvider = {customersInLine.remove(at: 0)}

print(customersInLine.count)

print("now serving \(customerProvider())!")

print(customersInLine.count)

//尽管在闭包的代码中，customersInLine 的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除。请注意，customerProvider 的类型不是 String，而是 () -> String，一个没有参数且返回值为 String 的函数。


//将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// 打印出 "Now serving Alex!"



//如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。
// customersInLine i= ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// 打印 "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// 打印 "Now serving Barry!"
// 打印 "Now serving Daniella!"

