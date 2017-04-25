//: Playground - noun: a place where people can play

import UIKit


/**
 Swift包含了C和OC上所有的数据类型，Int表示整形值；Double和Float表示浮点型值；Bool是布尔型值；String是文本型数据。Swift还提供了两个基本的集合类，Array和Dictionary
 */

/***************************************************
 *
 *          基础部分
 *
 ***************************************************/


/****************常量和变量****************/
let a = 10

var b = 10
b = 20

//类型标注
var c: Int   //表示声明一个名字为c的Int变量

c = 100

print("the value of c is \(c)")

//整数和浮点数转换
let d = 3.1415926

let sum = Double(a) + d

print(Int(sum))

//类型别名typealias


//Bool值：只有true和false两个值

let flag = true

if flag {
    print("yes")
}

//元组:把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型.只要你想，可以把任意顺序的类型组合成一个元组。你也可以将一个元组的内容分解成单独的常量和变量，然后就可以正常使用它们了：

let http404Error = (404,"Not found")
let (statusCode, statusMessage) = http404Error

print("the status code is \(statusCode)")
print("the status message is \(statusMessage)")

//如果只需要一部分元组值，分解的时候可以把要忽略的部分用下划线（_）标记
let (justTheStatusCode, _) = http404Error
print("the status code is \(justTheStatusCode)")

//此外，还可以通过下标来访问元组中的单个元素，下标从0开始
print("the status code is \(http404Error.0)")
print("the status message is \(http404Error.1)")

//你可以在定义元组的时候给耽搁元素命名
let http200Status = (statusCode: 200, description: "OK")

print(http200Status.statusCode)
print(http200Status.description)


//可选类型:使用可选类型来处理值又可能缺失的情况
//1.有值,等于x   或者没有值, "123"可以转变为Int，但是hello world不能转为数字
let possibleNum = "123"
let convertedNum = Int(possibleNum)

let possibleStr = "hello world"
let convertedStr:Int? = Int(possibleStr)


//if语句以及强制解析
if convertedNum != nil {
    print("yes")
}else{
    print("no")
}

//可选绑定:使用可选绑定来判断可选类型是否包含值，如果包含就把值赋给一个临时变量或者变量
//下述语句表示的意思是： 如果possibleNum可以被转变为Int，创建一个常量a，并将这个Int值赋给它
if let a = Int(possibleNum) {
    print(a)
}

//nil ： 在Swift中，nil不是指针，它是一个确切的值，用来表示值缺失，任何类型的可选状态都可以被设置为nil，不只是对象类型。  在OC中，nil表示一个指向不存在对象的指针



//隐式解析可选类型： 可选类型暗示了常量或者变量可以“没有值”。可选通过if语句来判断是否有值，如果有值的话可以通过可选绑定来解析值。  有时候在程序架构中，第一次被赋值之后，可以确定一个可选类型总会有值。在这种情况下，每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值。   这种类型的可选状态被定义为隐式解析可选类型。把想要用做可选的类型的后面的问号（？）改成感叹号（！）来声明一个隐式解析可选类型  当可选类型被第一次赋值之后就可以确定之后一直有值的时候，隐式解析可选类型非常有用。

//通俗的来说，一个可选类型用？表示，可能有值或者为nil，如果一个可选类型在被赋值之后，以后都能确定这个可选类型是有值的，那么，我们就可以用！替换？

let possibelString: String? = "an optional string" //此时问号表示可选类型
print(possibelString!) //用感叹号获取可选类型的值


let assumedString: String! = "an optional String" //此时用感叹号（！）替换了问号（？），原因是我们确定有值，实际上还是一个可选类型，这样做的好处是在以后获取值的时候不需要在后面加感叹号（！），直接就能取值
print(assumedString)


//断言
//可选类型可以让你判断值是否存在，你可以在代码中优雅得处理值缺失的情况。然后，在某些情况下，如果值缺失或者并不满足特定的条件，代码可能没有办法继续运行，这是，可以在代码中出发一个断言来结束代码运行并通过调试来找到值缺失的原因。

//使用断言进行调试
//断言会在运行的时候判断一个逻辑条件是否为true，从字面意思来说，断言“断言”一个条件是否为真。你可以使用断言来保证在运行其它代码之前，某些重要的条件已经被满足。如果条件判断为true，代码运行会继续进行；如果条件判断为false，代码停止运行，你的应用被终止。
//如果你的代码在调试环境下触发了一个断言，比如你在xcode中构建并运行一个应用，你可以清楚地看到不合法的状态发生在哪里并检查断言被处罚时你的应用的状态。此外，断言允许你附加一条调试信息。

//你可以用时全局assert函数来写一个断言。向assert函数在传入一个结果为true或者false的表达式以及一条信息，当表达式为false的时候这条信息会被显示：

//使用条件
/*
 1.帧数类型的下标索引被传入一个自定义下标脚本实现，但是下标索引值可能太小或者太大
 2.需要给函数传入一个值，但是非法的值可能导致函数不能正常运行
 3.一个可选值现在是nil，但是后面的代码运行需要一个非nil的值
 */









