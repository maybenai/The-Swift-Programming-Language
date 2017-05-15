//: Playground - noun: a place where people can play

import UIKit

/*
 构造过程是使用类、结构体或枚举类型的实例之前的准备过程。在新实例可用前必须执行这个过程，具体操作包括设置实例中每个存储型属性的初始值和执行其它必须的设置或初始化工作。
 
 通过定义构造器来实现构造过程，这些构造器可以看作是用来创建特定类型新实例的特殊方法。与OC中的构造器不同，Swift的构造器无需返回值，它们的主要任务是保证新实例在第一次使用前完成正确的初始化。
 */

/*
 存储属性的初始赋值
 类和结构体在创建实例时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。你可以在构造器中为存储型属性属性赋初值，也可以在定义属性时为其设置默认值。
 当你为存储型属性设置默认值或者在构造器中为其赋值时，它们的值是被直接设置的，不会厨房任何属性观察值。
 */

/*
 构造器：
 狗仔器在创建某个特定类型的新实例时被调用。它的最简形式类似于一个不带任何参数的实例方法，以init命名：
 */

//init() {
    //在此处执行构造过程
//}

struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0;
    }
}

var f = Fahrenheit()
print(f.temperature)


//构造参数: 自定义构造过程时，可以在定义中提供构造参数，指定所需值的类型和名字。构造参数的功能和语法跟函数和方法的参数相同

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit : Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.5
    }
    
}

let boilingPointOfWater = Celsius.init(fromFahrenheit: 212.0)

print(boilingPointOfWater.temperatureInCelsius)

let freezingPointOfWater = Celsius.init(fromKelvin: 273.15)

print(freezingPointOfWater.temperatureInCelsius)


/*
 参数的内部名称和外部名称
 跟函数和方法参数不同，构造参数也拥有一个在构造器内使用的参数名字和一个在调用构造器时使用的外部参数名字。
 然而，构造器并不像函数和方法那样在括号前加一个可辨别的名字。因此在调用构造器时，主要通过构造器中的参数名和类型来确定应该被调用的构造器。正因为参数如此重要，如果你在定义构造器时没有提供参数的外部名字，Swift会为狗仔器的每个参数自动生成一个跟内部名字相同的外部名
 */


struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
}

let magenta = Color.init(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color.init(white: 0.5)


//不带外部名的构造器参数： 如果不希望为构造器的某个参数提供外部名字，可以使用下划线(_)来显式描述它的外部名。以此重写上面所说的默认行为。


struct Celsius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
    
}

let bodyTemperature = Celsius2.init(37.0)

print(bodyTemperature.temperatureInCelsius)

//可选属性类型： 如果你定制的类型包含一个逻辑上允许取值为空的存储型属性--无论是因为它无法在初始化时赋值，还是因为它在之后某个时间点可以赋值为空--你都需要将它定义为可选类型。可选类型的属性将自动初始化nil，表示这个属性是有意在初始化时设置为空的。


class SurveyQuestion {
    var text: String
    var respinse: String?
    init(text: String) {
        self.text = text
    }
    
    func ask()  {
        print(text)
    }
}


let cheeseQuestion = SurveyQuestion.init(text: "do you like cheese?")
cheeseQuestion.ask()


//构造过程中常量属性的修改： 你可以在构造过程中的任意时间点给常量属性指定一个值，只要在构造过程结束时是一个确定的值。一旦常量属性被赋值，它将永远不可更改。   对于类的实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改


class SurveyQuestion2 {
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
    
}

let beetsQuestion = SurveyQuestion2.init(text: "how about beets")
beetsQuestion.ask()
beetsQuestion.response = "i also like beets.(but not with cheese)"

//默认构造器： 如果结构体或类的所有属性都有默认值，同时没有自定义的构造器，那么Swift会给这些结构体或类提供一个默认构造器。这个默认构造器将简单地创建一个所有属性值都设置为默认值的实例。

class shoppingListItem {
    var name: String?
    var quantity = 1
    
    var purchased = false
}

var item = shoppingListItem()

/*
 结构体的逐一成员构造器
 除了上面提到的默认构造器，如果结构体没有提供自定义的构造器，它们将自动获得一个逐一成员构造器，即使结构体的存储型属性没有默认值。
 逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。我们在调用逐一成员构造器时，通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值。
 */

struct Size {
    var width = 0.0 ,height = 0.0
}

let twoByTwo = Size.init(width: 2.0, height: 2.0)


/*
 值类型的构造器代理
 构造器可以通过调用其它构造器来完成实例的部分构造过程。这一过程称为构造器代理，它能减少多个构造器间的代码重复
 构造器代理的实现规则和形式在值类型和类类型中有所不同。值类型不支持继承，所以构造器代理的过程相对简单，因为它们只能代理给自己的其它构造器。类则不同，它可以继承自其它类，这意味着类有责任保证其所有继承的存储型属性在构在世也能正确的初始化。
 对于值类型，你可以使用self.init在自定义的构造器中引用相同类型中的其它构造器。并且你只能在构造器内部调用self.init
 
 如果你为某个值类型定义了一个自定义的构造器，你将无法访问到默认构造器。这种限制可以防止你为值类型增加了一个额外的且十分复杂的构造器之后，仍然有人错误的使用自动生成的构造器
 
 如果希望默认构造器、逐一成员构造器以及你自己的自定义构造器都能用来创建实例，可以将自定义的构造器写到扩展中，而不是写在值类型的原始定义中。
 */

struct Size2 {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    
    var size = Size2()
    
    init() {
        
    }
    
    init(origin: Point, size: Size2) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size2) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
}

let basic = Rect()


let originRect = Rect.init(origin: Point.init(x: 2.0, y: 2.0), size: Size2.init(width: 5.0, height: 5.0))

let centerRect = Rect.init(center: Point.init(x: 4.0, y: 4.0), size: Size2.init(width: 3.0, height: 3.0))


//类的继承和构造过程： 类里面的所有存储类型属性一一包括所有继承自父类的属性--都必须在构造过程中设置初始值。   Swift为类类型提供了两种构造器来确保实例中所有存储型属性都能获得初始值，它们分别是指定构造器和便利构造器

/*
 指定构造器和便利构造器
 指定构造器是类中最主要的构造器。一个指定构造器将会初始化类中提供的所有属性，并根据负累链往上调用父类的构造器来实现父类的初始化
 
 每一个类都必须拥有至少一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件。
 
 便利构造器是类中比较次要的、辅助型的构造器。可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入值的实例
 
 
 */

//指定构造器和便利构造器的语法

//convenience init() {
//}


/*
 类的构造器代理规则
 为了简化指定构造器和便利构造器之间的调用关系，Swift采用以下三条规则来限制构造器之间的代理调用
 1.指定构造器必须调用其父类的指定构造器
 2.便利构造器必须调用同类中定义的其它构造器
 3.便利构造器必须最终导致一个指定构造器被调用
 */


/*
 两段式构造过程
 Swift中类的构造过程包含了两个阶段。第一个阶段，每个存储型属性被引入它们的类指定一个初始值。当每个存储型属性的初始值被确定后，第二个阶段开始，它给每个类一次机会，在新实例准备使用之前进一步定制它们的存储型属性。
 两段式构造过程的使用让构造过程更安全，同时在整个类层级结构中给予了每个类完全的灵活性。两段式构造过程可以防止属性值在初始化之前被访问，也可以防止属性被另外一个构造器意外地赋予不同的值。
 
 Swift将执行4中有效的安全检查，以确保两段式构造过程能不出错的完成：
 1.指定构造器必须保证它所在类引入的所有属性都必须先初始化完成，之后才能将其构造任务向上代理给父类中的构造器
 2.指定构造器必须先向上代理调用父类构造器，然后再为继承的属性设置新值。
 3.便利构造器必须先代理调用同一类中的其它构造器，然后再为任意属性赋新值。
 4.构造器在第一阶段构造完成之前，不能调用任何实例方法，不能读取任何实例属性的值，不能引用self作为一个值。
 */



/*
 构造器的继承和重写
 Swift中的子类默认情况下不会继承父类的构造器。Swift的这种机制可以防止一个负累的简单构造器被一个更精细的子类继承，并被错误的用来创建子类的实例。
 */









