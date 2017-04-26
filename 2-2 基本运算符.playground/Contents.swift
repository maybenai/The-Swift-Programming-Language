//: Playground - noun: a place where people can play

import UIKit

/***************************************************
 *
 *          基本运算符
 *
 ***************************************************/


//赋值运算符
let b = 10
var a = 5
a = b   //a现在等于b

//如果赋值的右边是一个多元组，它的元素可以马上被分解多个常量或变量
let (x,y) = (1,2)  //x = 1, y = 2


//算术运算符
"hello" + "world"

9 % 4

-9 % 4

var i = 0

i += 2

//比较运算符
//等于（a = b）
//不等于(a != b)
//大于（a > b）
//小于(a < b)
//大于等于(a >= b)
//小于等于(a <= b)

//Swift也提供恒等（==）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例   每个比较运算符都返回了一个标示表达式是否成立的布尔值


//三目运算符:   问题？ 答案1 : 答案2 。如果问题成立，返回答案1，反之返回答案2

let contentHeight = 40
let hasHeader = true

let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//空合运算符: 空合运算符（a ?? b）将对可选类型a进行空判断，如果a包含一个值就进行解封，否则就返回一个默认值b。表达式a必须是optional类型。默认值b的类型必须要和a存储值的类型保持一致。
//空合运算符石对以下代码的简短表达方法:  


let defaultColor = "red"
let userDefinedColorName: String? = nil

var colorNameUse = userDefinedColorName ?? defaultColor


//区间运算符

for index in 1...5 {
    print(index)
}


for index in 1..<5 {
    print(index)
}



//逻辑运算符

/**** 
 NOT  !a
 AND  a & b
 OR   a || b
 
 */



















