//: Playground - noun: a place where people can play

import UIKit


//函数是一段完成特定任务的独立代码片段。你可以通过给函数命名来标识某个函数的功能，这个名字可以被用来在需要的时候“调用”这个函数来完成它的任务。
//当你定义一个函数时，你可以定义一个一个或多个有名字和类型的值，作为函数的输入，称为参数，也可以定义某种类型的值作为函数执行结束时的输出，称为返回类型


//这个例子中，函数名字时greet(person:String)，之所以叫这个名字是因为这个函数用一个人的名字当作输入，并返回向这个人问候的语句。
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

/*所有的这些信息汇总起来称为函数的定义，并以func作为前缀。指定函数返回值类型时，用
 ->(一个连字符后跟一个右尖括号)后跟返回类型的名称的方式来表示
 
 该定义描述了函数的功能，它期望接收什么作为参数和执行结束时它返回的结果是什么类型。这样的定义使得函数在别的地方以一种清晰的方式被调用
*/

print(greet(person: "anna"))

/*
 调用greet(person:)函数时，在圆括号中传给它一个String类型的实参。
*/

//为了简化这个函数的定义，可以将问候消息的创建和返回写成一句：
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}


//函数参数与返回值
//函数参数与返回值在Swift中非常灵活。可以定义任意类型的函数，包括从只带一个未名参数的简单函数到复杂的带有表达性参数名和不同参数选项的复杂函数


/*
 1.无参数函数
 函数可以没有参数。下面这个函数就是一个无参数的函数，当被调用时，它返回固定的String消息:
 */

func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())

/*
 2.多参数函数
 函数可以有多种输入参数，这些参数被包含在函数的括号之中，以都好分隔。
 */

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "bob", alreadyGreeted: true))


/*
 3.无返回值函数
 函数可以没有返回值。下面这个函数没有返回值，直接打印
 */
func greet2(person: String) {
    print("Hello, \(person)!")
}

greet2(person: "danna")

//因为这个函数不需要返回值，所以这个函数的定义中没有返回箭头(->)和返回类型。但是严格来说，虽然没有返回值被定义，但是函数依然返回了值。没有定义返回类型的函数会返回一个特殊的Void值。它其实是一个空的元组，没有任何元素，可以写成()

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")


/*
 4.多重返回值函数
 可以用元组类型让多个值作为一个复合值从函数中返回
 */

func minMax(array: [Int]) -> (minx: Int, max: Int){
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin,currentMax)
}

//minMax(array:)函数返回一个包含Int值的元组，这些值被标记为min和max，以便查询函数的返回值时可以通过名字访问它们。     在minMax(array:)函数体中，在开始后的时候设置两个工作变量currentMin和currentMax的值为数组中的第一个数。然后函数会遍历数组中剩余的值并检查该值是否比currentMin和currentMax更小或更大。最后数组中俄最小值与最大值作为一个包含两个Int值的元组返回

let bounds = minMax(array: [-5,-1,123,464,56])
print(bounds.minx,bounds.max)

//需要注意的是，元组的成员不需要在元组从函数中返回时命名，因为它们的名字已经在函数返回类型中指定了。




/*
 5.可选元组返回类型
 如果函数返回的元组类型有可能整个元组都“没有值”，你可以使用可选的optional元组返回类型反映整个元组可以是nil的事实。你可以通过在元组类型的右括号后放值一个问号来定义一个可选元组。
 注意： 可选元组类型如(Int,Int)?与元组包含可选类型如(Int?, Int?)是不同的，可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值
 */

//前面的minMax(array:)返回了一个包含两个Int值的元组。但是函数不会对传入的参数执行任何的安全检查，如果array参数是一个空数组，在试图访问array[0]时会触发一个运行时错误。为了安全地处理“空数组”问题，将minMax(array:)函数改写为可以使用可选元组返回类型，并且当数组为空时返回nil

func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


/*
 6.函数参数标签和参数名称
 每个函数参数都有一个参数标签以及一个参数名称。参数标签在调用函数的的时候使用；调用的时候需要将函数的参数标签写在对应的参数前面。参数名称在函数的实现中使用。默认情况下，函数参数使用参数名称来作为它们的参数标签
 */


/*
 7.指定参数标签
 你可以在函数名称前指定它的参数标签，中间以空格分隔
 */

func greet3(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet3(person: "Bill", from: "Cupertino"))


/*
 8.忽略参数标签
 如果不希望为某个参数添加一个标签，可以使用一个下划线来代替一个明确的参数标签
 */
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2)



/*
 9.默认参数值
 你可以在函数体中通过给参数赋值来为人意一个参数定义默认值。当默认值被定义后，调用这个函数时可以忽略这个参数
 */

func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault = 12


/*
 10.可变参数
 一个可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。通过在变量类型名后面加入(...)的方式来定义可变参数
 可变参数的传入值在函数体中变为此类型的一个数组。例如:一个叫做numbers的Double型可变参数，在函数体内可以当作一个叫numbers的[Double]型的数组常量
 
 一个函数只能拥有一个可变参数
 */

func arithmeticMean(_ numbers: Double...) -> Double{
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1,2,3,4,5,6,7,8))


/*
 11.输入输出参数
 函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出函数
 
 定义一个输入输出参数时，在参数定义前加inout关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。
 
 只能传递变量给输入输出参数，不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加&符，表示这个值可以被函数修改
 
 输入输出参数不能有默认值，而且可变参数不能用inout标记
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temoraryA = a
    a = b
    b = temoraryA
    
}

var someInt = 10
var anotherInt = 20
swap(&someInt, &anotherInt)


//输入输出参数和返回值是不一样的。上面的swapTwoInts函数并没有定义任何返回值，但仍然修改了someInt和anotherInt的值。输入输出参数是函数体外产生影响的另一种方式





/*
 12.函数类型
 每个函数都有种特定的函数类型，函数的类型由函数的参数类型和返回值类型组成
 */
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

//这2个函数都接受两个Int值，返回一个Int值。   这两个函数的类型是(Int, Int) -> Int,可以解读为“这个函数类型有两个Int型的参数并返回一个Int型的值”

func printHelloWorld() {
    print("hello, world")
}

//这个函数的类型是： () -> Void 或者叫“没有参数，并返回Void类型的函数”


/*
 13.使用函数类型
 在Swift中，使用函数类型就像使用其它类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它
 */

var mathFunction: (Int, Int) -> Int = addTwoInts



/*
 14.函数类型作为参数类型
 你可以用(Int,Int) -> Int这样的函数类型作为另一个函数的参数类型，这样可以将函数的一部分实现留给函数的调用者来提供
 */
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print(mathFunction(a,b))
}

printMathResult(addTwoInts, 3, 5)

//这个例子定义了printMathResult(_:_:_:)函数，它有3个参数：第一个参数叫mathFunction，类型是(Int，Int) -> Int,你可以传入任何这种类型的函数；第二个和第三个参数叫a和b，它们的类型都是Int，这2个值作为已给出的函数的输入值。   当printMathResult(_:_:_:)被调用时，它被传入addTwoInts函数和整数3和5.它用传入3和5调用addTwoInts，并输出结果：8      printMathResult(_:_:_:)函数的作用就是输出另一个适当类型的数学函数的调用结果。它不关心传入函数是如何实现的，只关心传入的函数是不是一个正确的类型。这使得printMathResult(_:_:_:)能以一种类型安全（type-safe）的方式将一部分功能转给调用者实现。





/*
 15.函数类型作为返回类型
 你可以用函数类型作为另一个函数的返回类型。需要做的是在返回箭头(->)后写一个完整的函数类型。
 */
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward:Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}


var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print(currentValue)
    currentValue = moveNearerToZero(currentValue)
}


/*
 16.嵌套函数
 以上所有函数叫全局函数，它们定义在全局域中。你也可以把函数定义在别的函数体中，称作 嵌套函数
 默认情况下，嵌套函数是对外界不可见的，但是可以被它们的外围函数调用。一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其它域中被调用。  可以用返回嵌套函数的方式重写chooseStepFunction(backward:)函数
 */

func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {return input + 1}
    func stepBackward(input: Int) -> Int {return input - 1}
    
    return backward ? stepBackward : stepForward
}

var currenValue2 = -4
let moveToZero = chooseStepFunction2(backward: currenValue2 > 0)

while currenValue2 != 0 {
    print(currenValue2)
    currenValue2 = moveToZero(currenValue2)
}







