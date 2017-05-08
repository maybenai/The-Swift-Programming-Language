//: Playground - noun: a place where people can play

import UIKit

//FOR-In循环 可以使用for-in循环来遍历一个集合中的所有元素，例如数组中的元素、数字范围或者字符串中的字符


let names = ["anna", "brian","jack"]

for name in names {
    print(name)
}

//通过遍历一个字典来访问它的简直对。遍历字典时，字典的每项元素会以(key,value)元组的形式返回，可以在for-in循环中使用显示的常量名称来解读(key，value)元组。

let numberOfLegs = ["spider":8, "ant": 6 ,"cat": 4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//字典的内容本质是无序的，遍历字典元素时不能保证顺序。特别的，将元素插入一个字典的书序并不会觉得它们被遍历的顺序。

for index in 1...5 {
    print(index)
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
    print(answer)
}



let minutes = 60
for tickMark in 0..<minutes {
    
}

//使用stride(from:to:by:)函数跳过不需要的标记
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}


for tickMark in stride(from: 0, through: minutes, by: minuteInterval) {
    print(tickMark)
}




//while循环   当本轮while循环运行完毕，会再检测循环条件是否需要再运行一次循环。


//Repeat-while 它和while的区别在判断循环条件之前，先执行一次循环的代码块 和其它语言的do-while类似



//条件语句
//If if语句最简单的形式就是只包含一个条件，只有该条件为true时，才执行相关代码

var temperatureInfahrenheit = 30
if temperatureInfahrenheit <= 32 {
    print("yes")
}

if temperatureInfahrenheit <= 20 {
    print("a")
}else{
    print("b")
}

//Switch语句  switch语句会尝试把某个值与若干个模式进行匹配。根据第一个匹配成功的模式，switch语句会执行对应的代码。当有可能的情况较多时，通常用switch替换if

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// 输出 "The last letter of the alphabet"

//每一个 case 分支都必须包含至少一条语句


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出 "There are dozens of moons orbiting Saturn."



//元组 我们可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是区间。另外使用下划线_来匹配所有可能的值
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("(0,0) is at the origin")
case (_,0):
    print("(\(somePoint.0), 0) is on the x-axis)")
case (0,_):
    print("(0,\(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0),\(somePoint.1)) is inside the box")
default:
    print("\(somePoint.0), \(somePoint.1) is out the box")
}



//where  case分支的模式可以使用wehere语句来判断额外的条件
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出 "(1, -1) is on the line x == -y"

//复合匹配
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}




//控制转移语句
//Continue : 告诉一个循环体立刻停止本次循环，重新开始下次循环
//Break :    Break语句会立刻结束整个控制流的执行。当你想要更早的结束一个switch代码块或者一个循环体时，可以使用break语句。
//循环语句的break :当一个循环体中使用break时，会立刻中断该循环体的执行，然后跳转到表示循环体结束的大括号(})后的第一行代码。不会再有本次循环的代码

//贯穿: swift中的switch不会从上一个分支落入到下一个分支中。相反，只要第一个匹配到的case分支完成了它需要执行的语句，整个switch代码块完成了它的执行
//fallthrough关键字不会检查它下一个将会落入执行的 case 中的匹配条件。fallthrough简单地使代码继续连接到下一个 case 中的代码，这和 C 语言标准中的switch语句特性是一样的。


/**带标签的语句 在swift中，你可以在循环体和条件语句中嵌套循环体和条件语句来创造复杂的控制流结构。并且，循环体和条件语句都可以使用break语句来提前结束整个代码块。因此，显式地指明break语句想要终止的是哪个循环体或者条件语句会很有用。 类似的，如果你有许多嵌套的循环体，显式指明continue语句想要影响哪一个循环体也会非常有用。
    
 为了实现这个目的，可以使用标签来标记一个循环体或者条件语句，对于一个条件语句，可以使用break加标签的方式来结束这个被标记的语句。对于一个循环语句，可以使用break或者continue加标签来结束或者继续这条被标记语句的执行。
 
 声明一个带标签的语句是通过载该语句的关键词的同一行放置一个标签，作为这个语句的前导关键字，并且该标签后面跟随一个冒号。
*/




//提前退出： 像if语句一样，guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句后的代码。不同于if语句，一个guard语句总是有一个else从句，如果条件不为真则执行else从句中的代码

func greet(person:[String: String]){
    guard let name = person["name"] else {
        return
    }
    print("\(name)")
    
    guard let location = person["location"] else {
        print("i hope the weather is nice near you")
        return
    }
    print("i hope the weather is nice in \(location)")
}

greet(person: ["name":"john"])

greet(person: ["name":"john","location":"CQ"])

/*如果guard语句满足条件，则继续执行guard语句大括号后的代码。将变量或者常量的可选绑定作为guard语句的条件，都可以保护guard语句后面的代码
 如果条件不被满足，在else分支上的代码就会被执行。这个分支必须转移控制以退出guard语句出现的代码段。它可以用控制转移语句如return、break、continue或throw做这件事，或者调用一个不返回的方法或函数，例如fatalError()
 相比于可以实现同样功能的if语句，按需使用guard语句会提升我们代码的可读性。它可以使你的代码连贯的被执行而不需要将它包在else中
*/


/*
 检查API可用性
 swift内置支持检查API可用性，这可以确保我们不会在当前部署机器上，不小心地使用了不可用的API
 */

if #available(iOS 10,macOS 10.12, *) {//在iOS使用iOS10或更高, 在macOS使用macOS 10.12或更高的API
}else{
    //使用先前版本的iOS和macOS的API
}



