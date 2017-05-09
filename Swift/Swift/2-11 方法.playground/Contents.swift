//: Playground - noun: a place where people can play

import UIKit

/*
 方法是与某些特定类型相关联的函数。类、结构体、枚举都可以定义实例方法；实例方法为给定类型的实例封装了具体的任务与功能。类、结构体、枚举也可以定义类型的方法；类型方法与类型本身相关联。类型方法与OC中的类方法类似。
 
 结构体和枚举能够定义的方法是Swift与OC/C的主要区别之一。在OC中，类是唯一能定义方法的类型，但在Swift中国年，你不仅能选择是否要定义一个类／结构体／枚举，还能灵活地在你创建的类型上定义方法
 */


/*
 实例方法：
 实例方法是属于某个特定的类、结构体或者枚举类型实例的方法。实例方法提供访问和修改实例属性的方法或提供与实例目相关的功能，并以此来支撑实例的功能。
 
 实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。实例方法智能被它所属的类的某个特定实例调用实例方法不能脱离现存的实例而被调用。
 */


class Counter {
    var count = 0
    
    func increment()  {
        count += 1
//        self.count += 1
    }
    
    func increment(by amount: Int)  {
        count += amount
    }
    
    func reset()  {
        count = 0
    }
    
}

/*
 increment让计数器按一递增；
 increment(by: Int)让计数器按一个指定的整数值递增；
 reset将计数器重置为0。
 Counter这个类还声明了一个可变属性count，用它来保持对当前计数器值的追踪。
 */

let counter = Counter()

counter.increment()

print(counter.count)

counter.increment(by: 5)

print(counter.count)

counter.reset()

print(counter.count)

//self 属性  ： 类型的每一个实例都有一个隐含属性叫做self，self完全等同于该实例本身。你可以在一个实例的实例方法中使用这个隐含的self属性来引用当前实例。


struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
    
}

let somePoint = Point(x: 4.0, y:5.0)
if somePoint.isToTheRightOfX(x: 1.0) {
    print("this point is to the right of the line where x == 1.0")
}


/*
 在实例方法中修改值类型：
 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
 但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的self属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例
 
 */


struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX:Double, y deltaY: Double) {
//        x += deltaX
//        y += deltaY
        
        self = Point2(x: x + deltaX, y : y + deltaY)
    }
}


var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(deltaX: 2.0, y: 3.0)

print(somePoint2.x, somePoint2.y)



/*
 类型方法
 实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法a.zai方法的func关键字之前加上static，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现。
 */

class SomeClass {
    class func someTypeMethod() {
        //这里实现类型方法
    }
}

SomeClass.someTypeMethod()


struct LevelTracker {
    static var highestUnlockedLevel = 1
    
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        }else {
            return false
        }
    }
    
}



class Player {
    var tracker = LevelTracker()
    let playName: String
    func complete(level: Int)  {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playName = name
    }
    
}

var player = Player(name: "argyrios")

player.complete(level: 1)

print(LevelTracker.highestUnlockedLevel)


