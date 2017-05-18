//: Playground - noun: a place where people can play

import UIKit

/*
 扩展就是为一个已有的类、结构体、枚举类型或者协议类型添加新功能。这包括在没有权限获取原始源代码的情况下扩展类型的能力(即逆向建模)。
 
 Swift中的扩展可以：
 1.添加计算型属性和计算型类型属性
 2.定义实例方法和类型方法
 3.提供新的构造器
 4.定义下标
 5.定义和使用新嵌套类型
 6.使一个已有类型符合某个协议
 
 在Swift中，可以对协议进行扩展，提供协议要求的实现，或者添加额外的功能，从而可以让符合协议的类型拥有这些功能。
 */

//语法： 使用extension关键字来声明扩展

/*
extension SomeType {
    //为SomeType添加新的新功能写到这里面
}
 */


//计算型属性：

extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm

print("One inch is \(oneInch) meters")

/*
 构造器:
 扩展可以为已有类型添加新的构造器。这可以让你扩展其他类型，将自己的定制类型作为其构造器参数，或者提供该类型的原始实现中未提供的额外初始化选项。
 
 扩展能为类添加新的便利构造器，但是他们不能为类添加新的指定构造器或析构器。指定构造器和析构器必须总是由原是的类实现来提供。
 
*/


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}


let defaultRect = Rect()

let memberwiseRect = Rect.init(origin: Point.init(x: 2.0, y: 2.0), size:Size.init(width: 5.0, height: 5.0))

//可以提供一个额外的接受指定中心点和大小的构造器来扩展Rect结构体

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.width / 2)
        
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}


//方法：扩展可以为已有类型添加新的实例方法和类型方法。

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0 ..< self {
            task()
        }
    }
}





