//: Playground - noun: a place where people can play

import UIKit

/*
 属性将值跟特定的类、结构或枚举关联。存储属性存储常量或变量作为实体的一部分，而计算属性计算一个值。计算属性可以用于类、结构体和枚举，存储属性智能用于类和结构体
 
 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性被称为类型属性。
 
 另外，还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自己定义的存储属性上，也可以添加到从父类继承的属性上
 */

/*
 存储属性：
 
 简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性，也可以是常量存储属性
 
 可以在定义存储属性的时候指定默认值，也可以在构造过程中设置或修改存储属性
*/

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//FixedLengthRange的实例包含一个firstValue的变量存储属性和一个名为length的常量存储属性，在上面的例子中，length在创建实例的时候被初始化，因为它是一个常量存储属性，所以之后无法修改它的值


//常量结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfThreeItems.firstValue = 6 这一句会报错


/*
 延迟存储属性：
 
 延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。在属性生命前使用lazy来表标示一个一个延迟存储属性(延迟属性必须备声明为变量，因为属性的厨师值可能在实例构造完成之后才会得到。而常量属性在构造过程之前必须要有初始值，因此无法声明为延迟属性)
 */

class DataImporter {
    /*
     DataImporter是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间
     */
    var fileName = "data.text"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")


/*
 存储属性和实例变量
 Swift中的属性没有对应的实例变量，属性的后端存储也无法直接访问。这就避免了不同场景下访问方式的困扰，同时也将属性的定义简化成一个语句。属性的全部信息一一包括命名、类型和内存管理特征--都在唯一一个地方定义
 */

//计算属性：除存储实行外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或变量的值。

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//只读计算属性： 只有getter没有setter的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值。    必须使用var关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let关键字只用来声明常量属性，表示初始化后再无法修改的值
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

/*属性观察器 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。 可以为了出了延迟属性之外的其他存储属性添加属性观察器，也可以通过重写属性的方式为继承的属性(包括存储属性和计算属性)添加属性观察器
 
 willSet在新的值被设置之前调用
 didSet在新的值被设置之后立即调用
 
 willSet观察器会将新的属性值作为常量参数传入，在willSet的实现代码中可以为这个参数指定一个名称，如果不指定则参数仍然可用，这时使用默认名称newValue表示
 
 同样，didSet观察器会将旧的属性值作为参数传入，可以为该参数命名活着使用默认参数名oldValue。
 
 父类的属性在子类的构造器中被赋值时，它在弗雷中的willSet和didSet观察器会被调用，随后才会调用子类的观察器。在弗雷初始化方法调用之前，子类给属性赋值时，观察器不会被调用。

*/

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print(newTotalSteps)
        }
        
        didSet {
            if totalSteps > oldValue {
                print("added \(totalSteps - oldValue) steps")
            }
        }
    }
    
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 896

//全局变量和局部变量  计算属性和属性观察器所描述的功能也可以用于全局变量和局部变量。全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。   另外，在全局或局部范围都可以定义计算型变量和为存储型变量定义观察器。计算型变量跟计算属性一样，返回一个计算结构而不是存储器，声明格式也完全一样    全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记lazy修饰符      局部范围的错行量或变量从不延迟计算


/*
 类型属性:
 实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有自己的一套属性值，实例之间的属性相互独立
 也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性
 
 跟实例的存储型属性不同，必须给存储属性类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值
 存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。
 */
