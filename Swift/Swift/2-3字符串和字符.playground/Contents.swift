//: Playground - noun: a place where people can play

import UIKit


/***************************************************
 *
 *          字符串和字符
 *
 ***************************************************/


/**
 通过String类型来表示例如“hello， world”这样的有序的Character类型的值的集合

 */

//字符串字面量
let someString = "some string literal value"

//空字符串
var emptyString = ""

//初始化方法
var anotherEmptyString = String()

//可以通过检查其Bool类型的isEmpty属性来判断该字符串是否为空

if emptyString.isEmpty {
    print("empty")
}

//字符串可变性
var variableString = "horse"
variableString += "and carriage"

let constantString = "Highlander"
//这样会报编译错误，因为let修饰的不可改
//constantString += "and another highlander"

/**
 字符串是值类型:
 Swift的String类型是值类型。如果你创建了一个新的字符串，那么当其进行常量、变量赋值操作，或在函数／方法中传递时，会进行值拷贝。在任何情况下，都会对已有字符串创建新副本，并对该新副本进行传递或赋值操作。
 */


//使用字符

for character in "Dogs!".characters {
    print(character)
}
/*
 D
 o
 g
 s
 !
 */

//通过标明一个Character类型并用字符字面量进行赋值，可以建立一个独立的字符常量或变量
let exclamationMark : Character = "!"

//字符串可以通过传递一个值类型为Character的数组作为自变量来初始化
let catCharacters: [Character] = ["C","a","t"]
let catString = String(catCharacters)

//连接字符串和字符
//字符串可以通过加法运算符（+）相加在一起创建一个新的字符串

let string1 = "hello,"
let string2 = "there"

var welcome = string1 + string2

//可以通过加法赋值运算符（+=）将一个字符串添加到一个已经存在字符串变量上

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

//字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


/*
 Unicode是一个国际标准，用于文本的编码和表示。它使您可以用标准格式来表示任意语言几乎所有的字符，并能够对文本文件或网页这样的外部资源中的字符进行读写操作。
 */

//Unicode标量
//Swift的String类型是基于Unicode标量建立的。Unicode标量是对应字符或者修饰符的唯一的21位数字


//访问和修改字符串

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
//endIndex的前一个字符
greeting[greeting.index(before: greeting.endIndex)]
//开始的第一个字符的第二个字符
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 4)
greeting[index]


//使用characters属性的indices属性会创建一个包含全部缩阴的范围（Range），用来在一个字符串中访问单个字符

for index in greeting.characters.indices {
    print("\(greeting[index])",terminator:"")
}


//插入和删除
//调用insert(_:at:)方法可以在一个字符串的制定索引插入一个字符，调用insert(contentsOf:at:)方法可以在一个字符串的指定索引插入一个段字符串

var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)

welcome2.insert(contentsOf: "there".characters, at: welcome2.index(before: welcome2.endIndex))

//调用remove(at:)方法可以在一个字符串的制定索引删除一个字符，调用removeSubrange(_:)方法可以在一个字符串的制定索引删除一个子字符串

welcome2.remove(at: welcome2.index(before: welcome2.endIndex))

print(welcome2)


//比较字符串
let quotation = "we are a lot alike,you and i"
let someQuotation = "we are a lot alike,you and i"

if quotation == someQuotation {
    print("yes")
}


//前缀后缀相等
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]


var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    }else if scene.hasSuffix("Friar Lawrence's cell"){
        cellCount += 1
    }
}









