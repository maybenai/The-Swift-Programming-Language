//: Playground - noun: a place where people can play

import UIKit

/*
 枚举为一组相关的值定义了一个共同的类型，使你可以在你的代码中以类型安全的方式来使用这些值。
 Swift相比C中的枚举更加灵活，不必给每一个枚举成员提供一个值。如果给枚举成员提供一个值(称为“原始”值)，则该值的类型可以是字符串，字符，或是一个整型值或浮点数
 
 此外，枚举成员可以指定任意类型的关联值存储到枚举成员中，就像其它语言中的联合体和变体。你可以在一个枚举中定义一组相关的枚举成员，每一个枚举成员都可以有适当类型的关联值
 
 在Swift中，枚举类型是一等类型。它们采用了很多在传统上只被类所支持的特性，例如计算属性，用于提供枚举值的附加信息，实例方法，用于提供和枚举值相关联的功能。枚举也可以定义构造函数来提供一个厨师值；可以在原始的基础上扩展它们的功能，还可以遵循协议来提供标准的功能
 */

//枚举语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}
//可以使用case关键字来定义一个新的枚举成员值
//与C和OC不同，Swift的枚举成员在被创建时不会被赋予一个默认的整形值。在上面的CompassPoint例子中，north，south，east，west不会被隐式地赋值为0，1，2和3.相反，这些枚举成员本身就是完备的值，这些值的类型是已经明确定义好的CompassPoint类型

//多个成员值可以出现在同一行上，用逗号隔开
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//每个枚举定义了一个全新的类型。像 Swift 中其他类型一样，它们的名字（例如CompassPoint和Planet）应该以一个大写字母开头。给枚举类型起一个单数名字而不是复数名字，以便于读起来更加容易理解：


var directionToHead = CompassPoint.west

//directionToHead的类型可以被它CompassPoint的某个值初始化时推断出来。一旦directionToHead被声明为CompassPoint类型，你可以使用更简短的点语法将其设置为另一个CompassPoint的值

directionToHead = .north


//使用Switch语句匹配枚举值
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
//如果忽略了其中一个，上面的代码将无法通过变异，因为它没有考虑到CompassPoint的全部成员。强制穷举确保了枚举成员不会被意外遗漏。   当步需要匹配每个枚举成员的时候，你可以提供一个default分支来涵盖所有未明确处理的枚举成员

let somePlant = Planet.earth
switch somePlant {
case .earth:
    print("mostly harmless")
default:
    print("not a safe place for humans")
}

//关联值
enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 打印 "QR code: ABCDEFGHIJKLMNOP."




//原始值： 以下是一个使用ASCII码作为原始值的枚举
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//原始值可以是字符串，字符，或者任意整型值或浮点值型。每个原始值在枚举声明中必须是唯一的。     原始值和关联值不同的。原始值在定义枚举时被预先填充的值，想上述三个ASCII码。对于一个特定的枚举成员，它的值始终不变。关联值是创建一个基于枚举成员的常量或者是变量时才设置的值，枚举成员的关联值可以变化




//原始值的隐式赋值： 在使用原始值为整数或者字符串类型的枚举时，不需要显示地为每一个枚举成员设置原始值，Swift将会自动为你赋值。
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//mercury的值为1，venus的值为2，以此类推


print(Planet2.venus.rawValue)



//使用原始值初始化枚举实例： 如果在定义枚举类型的时候使用了原始值，那么将会自动获得一个初始化方法，这个方法接收一个叫做rawValue的参数，参数类型即为原始值类型，返回值则是枚举成员或nil。可以使用这个初始化方法来创建一个新的枚举实例

let possiblePlanet = Planet2(rawValue: 7)
//然而，并非所有Int值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。

let positionToFind = 11
if let somePlant = Planet2(rawValue: positionToFind) {
    switch somePlant {
    case .earth:
        print("mostly harmless")
    default:
        print("not a safe place for humans")
    }
}else {
    print("there is not a planet at position \(positionToFind)")
}
//这个例子使用了可选绑定，试图通过原始值11来访问一个行星。  if let somePlant = Planet2(rawValue: positionToFind)语句创建了一个可选的Planet，如果可选Planet的值存在，就会赋值给somePlanet。在这个例子中，无法检索到11的行星，所以else分支被执行


//递归枚举: 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。可以在枚举成员前加上indirect来表示该成员可递归

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
        
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}


print(evaluate(product))

