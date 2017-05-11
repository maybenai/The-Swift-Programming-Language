//: Playground - noun: a place where people can play

import UIKit

/*
 一个类可以继承另一个类的方法，属性和其他特性。当一个类继承其它类是时，继承类叫子类，被继承类叫超类(父类)。在Swift中，继承是区分类与其它类型的一个基本特征。
 
 在Swift中，类可以调用和访问超类的方法，属性和下标，并且可以重写这些方法啊，属性和下标来优化或者修改它们的行为。Swift会检查你的重写定义在超类中是否有匹配的定义，以此确保你的重写行为是正确的。
 
 可以为类中继承来的属性添加属性观察器，这样以来，当属性值改变时，类就会被通知到，可以为任何属性添加属性观察器，无论它原本被定义为存储型属性还是计算型属性。
 */

/*
 定义一个基类： 不继承于其它类的类，称之为基类
 在Swift中的类并不是从一个通用的基类继承而来。如果你不为你定义的类指定一个超类的话，这个类就自动成为基类
*/

class Vehicle {
    
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()

print("Vehice: \(someVehicle.description)")


/*
 重写：
 子类可以为继承来的实例方法，类方法，实例属性，或下标提供自己定制的实现。我们把这种行为叫重写。
 如果要重写某个特性，你需要在重写定义的前面加上override关键字。这么做，就表明了你是想提供一个重写版本，而非错误地提供了一个相同的定义。意外的重写行为可能会导致不可预知的错误，任何缺少override关键字的重写都会在编译时被诊断为错误。
 override关键字会提醒Swift编译器去检查该类的超类(或其中一个父类)是否有匹配重写版本的声明。这个检查可以确保你的重写定义是正确的。
 */


/*
 访问超类的方法，属性及下标
 当你在子类中重写超类的方法，属性或者下标时，有时在你的重写版本中使用已经存在的超类实现会大有裨益。比如，你可以完善已有实现的行为，或在一个继承来的变量中存储一个修改过的值。
 在合适的地方，你可以通过super前缀来访问超类版本的方法，属性或下标：
 1.在方法someMethod()的重写实现中，可以通过super.someMethod()来调用超类版本的someMethod()方法。
 2.在属性someProperty的getter或setter的重写实现中，可以通过super.someProperty来访问超类版本的someProperty属性。
 3.在下标的重写实现中，可以通过super[someIndex]来访问超类版本中的相同下标
 */

/*
 重写方法：
 在子类中，你可以重写继承来的实例方法或者类方法，提供一个定制或替代的方法实现。
 */

class Train: Vehicle {
    override func makeNoise() {
        print("choo choo")
    }
}

let train = Train()
train.makeNoise()

/*
 重写属性：
 你可以重写继承来的实例属性或者类型属性，提供自己定制的getter和setter，或添加属性观察器使重写的属性可以观察属性值什么时候发生改变。
 
 重写属性的Getters和Setters
 你可以提供定制的getter(或setter)来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性，子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。你在重写一个属性时，必须将它的名字和类型都写出来。这样才能使编译器去检查你重写的属性是与超类中同名同属性的属性相匹配的。
 
 你可以将一个继承来的只读属性重写为一个读写属性，只需要在重写版本的属性里提供getter和setter即可。但是，你不可以将一个继承来的读写属性重写为一个只读属性。
 
 如果你在重写属性中提供了setter，那么你也一定要提供getter。如果你不想在重写版本中的getter里修改继承来的属性值，你可以通过super.someProperty来返回继承属性的值，其中，someProperty是你要重写的属性的名字。
 */


class Car: Vehicle {
    var gear = 1
    
    override var description: String {
        return super.description + "in gear \(gear)"
    }
    
}


/*
 重写属性观察器
 你可以通过重写属性为一个继承来的属性添加属性观察器。这样以来，当继承来的属性值改变时，你就会被通知到，无论那个属性原本是如何实现的。
 不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供了willSet或didSet实现是不恰当
 此外，还要注意，不可以同时提供重写的setter和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的setter，那么你在setter中就可以观察到任何值变化了。
 */

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0

print("automaticCar: \(automatic.description)")

/*
 防止重写：
 可以通过把方法，属性或者下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可
 
 如果重写了带有final标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为final的
 
 可以通过在关键字class前添加final修饰符(final class)来将整个类标记为final的。这样的类是不可被继承的，试图继承这样的类会导致编译器报错
 */






