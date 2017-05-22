//: Playground - noun: a place where people can play

import UIKit

/*
 协议定义了一个蓝图，规定了用来实现某一特定任务或者功能的方法、属性，以及其它需要的东西。类、结构体或枚举都可以遵循协议，并为协议定义的这些要求提供具体实现。某个类型能够满足某个协议的要求，就可以说该类型遵循这个协议
 
 除了遵循协议的类型必须实现的要求外，还可以对协议进行扩展，通过扩展来实现一部分要求或者实现一些附加功能，这样遵循协议的类型就能够使用这些功能。
 */

/*
 属性要求：
 协议可以要求遵循协议的类型提供特定名称和类型的实例属性或类型属性。协议不指定属性是存储型属性还是计算型属性，它只指定属性的名称和类型。此外，协议还指定属性是可读的还是可读可写的。
 
 如果协议要求属性是可读可写的，那么该属性不能是异常属性或只读的计算型属性。如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。
 
 协议总是用var关键字来声明变量属性，此类型声明后加上{set get}来表示属性是可读可写的，可读属性则用{get}来表示
 */

protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int {get}
}

//当协议中定义类型属性时，总是使用static关键字作为前缀。当类类型遵循协议时，除了static关键字，还可以使用class关键字来声明类型属性
protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}


protocol FullyNamed {
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
    
}

let john = Person.init(fullName: "john appleseed")

class Starship: FullyNamed {

    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
}

var ncc1701 = Starship.init(name: "Enterprise", prefix: "USS")

/*
 方法要求
 协议可以要求遵循协议的类型实现耨鞋指定的实例方法或者类方法。这些方法作为协议的一部分，像普通方法一样放在协议的定义中，但是不需要大括号和方法体。可以在协议中定义具有可变参数的方法，和普通方法的定义方式相同。但是，不支持为协议中的方法的参数提供默认值。
 在协议中定义类方法的时候，总是使用static关键字作为前缀。当类类型遵循协议时，除了static关键字，还可以使用class关键字作为前缀
 */

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()


//构造器要求在类中的实现
/*
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        //这里是构造器的实现部分
    }
}
*/


/*
 委托模式：
 委托是一种设计模式，它允许类或结构体将一些需要它们负责的功能委托给其它类型的实例。委托模式的实现很简单：定义协议来封装那些需要被委托的功能，这样就能确保遵循协议的类型能提供这些功能。委托模式可以用来响应特定的动作，或者接收尾部数据源提供的数据，而无需关心外部数据源的类型
 */



/*
 检查协议一致性
 可以使用类型转换中描述的is和as操作符来检查协议一致性，即是否符合某协议，并且可以转换到指定的协议类
 is 用来检查实例是否符合某个协议，若符合则返回true，否则返回false
 as？ 返回一个可选值，当实例符合某个协议时，返回类型为协议协议类型的可选值，否则返回nil
 as! 将实例强制向下转型到某个协议类型，如果强转失败，会引发运行时错误
 */


/*
 可选的协议要求：
 协议可以定义可选要求，遵循协议的类型可以选择是否实现这些要求。在协议中使用optional关键字作为前缀来定义可选要求。可选要求用在你需要和OC打交道的代码中。协议和可选要求都必须带上@objc属性。标记@objc特性的协议只能被继承自OC类的类或者@objc类遵循，其它类以及结构体和枚举均不能遵循这种协议。
 使用可选要求时，它们的类型会自动编程可选的。
 
 协议中的可选要求可通过可选链式调用来使用，因为遵循协议的类型可能没有实现这些可选要求。可以在可选方法名称后加上？来调用可选方法。
 */


/*
 协议扩展：
 协议可以通过扩展来为遵循协议的类型提供属性、方法以及下标的实现。通过这种方式，你可以给予协议本身来实现这些功能，而无需在每个遵循协议的类型中都重复同样的实现，也无需使用全局函数。
 */

/*
 提供默认实现
 可以通过协议扩展来为协议要求的属性、方法以及下标提供默认的实现。如果遵循协议的类型为这些要求提供了自己的实现，那么这些自定义实现将会替代扩展中的默认实现被使用。
 通过协议扩展为协议要求提供的默认实现和可选协议要求不同。虽然在这两种情况下，遵循协议的类型都无需自己实现这些要求，但是通过扩展提供的默认实现可以直接调用，而无需使用可选链式调用
 */


/*
 为协议扩展添加限制条件
 在扩展协议的时候，可以指定一些限制条件，只有遵循协议的类型满足这些限制条件时，才能获得协议扩展提供的默认实现。这些限制条件写在协议名之后，使用where子句来描述。
 */



