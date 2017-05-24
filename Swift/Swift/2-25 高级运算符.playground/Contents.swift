//: Playground - noun: a place where people can play

import UIKit


//1.按位取反 ～

let initilaBits: UInt8 = 0b00001111
let invertedBits = ~initilaBits


//2.按位与

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b001111111

let middleFourBits = firstSixBits & lastSixBits

//3.按位或 |
let middleFourBits2 = firstSixBits | lastSixBits


//4.按位异或
let outputBits = firstSixBits ^ lastSixBits


/*
 5.按位左移、右移运算符 :  
 按位左移运算符(<<) 和按位右移运算符(>>)可以对一个数的所有位进行指定位数的左移和右移，但是需要遵守下面定义的规则。
 
 对一个数进行按位左移或按位右移，相当于对这个数进行乘以2或除以2的运算。将一个整数左移一位，等于乘以2，右移一位等于除以2
 
 无符号整数的移位运算
 对无符号整数进行移位的规则如下：
 1.已经存在的位按指定的位数进行左移和右移
 2.任何因移动而超出整型存储方法的位都会被丢弃
 3.用0来填充移位后产生的空白位
 */


let shiftBits: UInt8 = 4
shiftBits << 1
shiftBits << 2

shiftBits << 5

shiftBits << 6

shiftBits >> 2


//6.益处运算符 :  在默认情况下，当向一个证书赋予超过它容量的值时，Swift默认会报错，而不是生成一个无效的数。这个行为为我们在运算过大或者过小的数的时候提供了额外的安全性。

var potentialOverflow = Int16.max

potentialOverflow = potentialOverflow &+ 1


//运算符函数

struct Vector2D {
    
    var x = 0.0, y = 0.0
    
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y:left.y + right.y)
    }
}








