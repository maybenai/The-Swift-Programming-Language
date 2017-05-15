//: Playground - noun: a place where people can play

import UIKit

/*
 Swift使用自动引用计数机制来跟踪和管理你的应用程序的内存。通常情况下，Swift内存管理机制会一直起作用，你无须自己来考虑内存的关咯。ARC会在类的实例不在被使用时，自动释放其占用的内存。
 
 引用计数仅仅应用于类的实例。结构体和枚举类型是值类型，不是引用类型，也不是通过引用的方式存储和传递
 
 */

/*
 自动引用计数的工作机制：
 当你每次创建一个类的新的实例的时候，ARC会分配一块内存来存储该实例信息。内存中会包含实例的类型信息，以及这个实例所有相关的存储型属性的值。
 
 此外，当实例不再被使用时，ARC释放实例所占用的内存，并让释放的内存能挪作他用。这确保了不再被使用的实例，不回一直占用内存空间。
 
 然而，当ACR收回和释放了正在被使用中的实例，该实例的属性和方法将不能再被访问和调用。实际上，如果你试图访问这个实例，你的应用程序很可能会崩溃。
 
 为了确保使用中的实例不回被销毁，ARC会跟踪和计算每一个实例正在被多少属性，常量和变量所引用。哪怕实例的引用数为1，ARC都不会销毁这个实例。
 
 为了使上述成为可能，无论你将实例赋值给属性、常量或变量，他们都会创建此实例的强引用。之所以称之为“引用”是因为它会将实例牢牢地保存住，只要强引用还在，实例是不允许被销毁的。
 */

class Person {
    let name: String
    
    init(name: String) {
        
        self.name = name
        
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

var reference1: Person?
var reference2: Person?
var reference3: Person?


reference1 = Person.init(name: "John appleseed")

reference1 = nil

/*
 类实例之间的循环强引用
 如果两个类实例互相持有对方的强引用，因而每个实例都让对方一直存在，就是这种情况，这就是所谓的循环强引用。
 
 你可以通过定义类之间的关系为弱引用或无主引用，以替代强引用，从而解决了循环强引用的问题。
 */


class Person1 {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var apartment: ApartMent?
    
    deinit {
        print("Person1 \(name) is being deinitialized")
    }

}

class ApartMent {
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    weak var tenant: Person1?
    
    deinit {
        print("ApartMent \(unit) is being deinitialized")
    }
    
}


var john: Person1?
var unit4A: ApartMent?

john = Person1.init(name: "john")
unit4A = ApartMent.init(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john


john = nil
unit4A = nil


/*
 解决实例之间的循环强引用
 Swift提供了2种办法用来解决你在使用类的属性时所遇到的循环强引用问题：弱引用和无主引用
 
 弱引用和无主引用允许循环引中的一个实例引用而另一个实例不保持强引用。这样实例能够互相引用而不产生循环强引用。
 
 当其它的实例有更短的生命周期时，使用弱引用，也就是说，当其他实例析构在先时。
 
 弱引用
 
 弱引用不会对其引用的实例保持强引用，因而不会阻止ARC销毁被引用的实例。这个特性阻止了引用变为循环强引用。声明属性或者变量时，在前面加上weak关键字是表明这是一个弱引用。
 
 因为弱引用不会保持所引用的实例，即使引用存在，实例也有可能被销毁。因此，ARC会在引用的实例被销毁后自动将其赋值为nil。并且因为弱引用可以允许它们的值在运行时被赋值为nil，所以它们会被定义为可选类型变量，而不是常量。
 
 */



/*
 闭包引起的循环强引用
 循环引用还会发生在当你将一个闭包赋值给类实例的某个属性，并且这个闭包体中又使用了这个类实例时。这个闭包体中可能访问了实例的某个属性。这个闭包体中可能访问了实例的某个属性，或者闭包中调用了实例的某个方法，这两种都导致了闭包捕获“self”，从而产生了循环强引用。
 循环强引用的产生，是因为闭包和类相似，都是引用引用类型。当你把一个闭包赋值给某个属性时，你时将这个闭包的引用赋值给了属性。
 Swift提供了一种优雅的方法来解决这个问题，称之为闭包捕获列表。
 
 */

class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        }else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name;
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

let heading = HTMLElement.init(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}


print(heading.asHTML())
var paragraph: HTMLElement? = HTMLElement.init(name: "p", text: "hello world")

print(paragraph!.asHTML())

/*
 定义捕获列表
 捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用或初始化过的变量。
 如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方
 */

/*
 弱引用和无主引用
 在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用
 相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。弱引用总是可选类型，并且当引用的实例被销毁后，弱引用的值会自动置为nil。这使我们可以在闭包体内检查它们是否存在。
 注意： 如果被捕获的引用绝对不会变为nil，应该用无主引用，而不是弱引用
 */


/*
 解决闭包引起的循环强引用
 在定义闭包时同时定义捕获列表作为闭包的一部分，通过这种方式可以解决闭包和类实例之间的循环强引用。捕获列表定义了闭包体内捕获一个或者多个引用类型的规则，跟解决两个类实例间的循环强引用一样，声明每个捕获的引用为弱引用或无主引用，而不是强引用。
 */

/*
 定义捕获列表：
 捕获列表中的每一项都由一对元素组成，一个元素是weak或unowned关键字，另一个元素是类实例的引用或初始化过的变量
 
 */

// 1.如果闭包有参数列表和返回类型，把捕获列表放在它们前面
/*
lazy var someClosure: (Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
    // 这里是闭包的函数体
}
*/

//2.如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方
/*
 lazy var someClosure: Void -> String = {
 [unowned self, weak delegate = self.delegate!] in
 // 这里是闭包的函数体
 }
 */


//弱引用和无主引用
//在闭包和捕获的实例总是互相引用并且总是同时销毁时，将闭包内的捕获定义为无主引用,相反的，在被捕获的引用可能会变为nil时，将闭包内的捕获定义为弱引用。弱引用总是可选类型的，并且当引用的实例被销毁后，弱引用的值会自动置为nil


