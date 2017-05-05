//: Playground - noun: a place where people can play

import UIKit

/*
 类和结构体是人们构建代码所用的一种通用且灵活的构造体。我们可以使用完全相同的语法规则来为类和结构体定义属性和添加方法，从而扩展类和结构体的功能。
 与其他编程语言不同的是，Swift并不要求你为自定义类和结构去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类或者结构体，系统将会自动生成面向其他代码的外部接口。
 
 通常一个类的实例被称为对象。然而在Swift中，类和结构体的关系要比在其他语言中更加密切
 */

/*
 类和结构体对比:
 Swift中类和结构体的共同点在于：
 1.定义属性用语存储值
 2.定义方法用于提供功能
 3.定义下标操作使得可以通过下标语法来访问实例所包含的值
 4.定义构造器用语生成初始化值
 5.通过扩展以增加默认实现的功能
 6.实现协议以提供某种标准功能
 
 与结构体相比，类还有如下的附加功能
 1.继承允许一个类继承另一个类的特征
 2.类型转换允许在运行时检查和解释一个类实例的类型
 3.析构器允许一个类实例释放任何其所被分配的资源
 4.引用计数允许对一个类的多次引用
 */

//定义语法： 类和结构体有着相类似的定义方式。
class SomeClass {
    // 在这里定义类
}
struct SomeStructure {
    // 在这里定义结构体
}

//以下是定义结构体和定义类的示例：
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//在上面的示例中我们定义了一个名为Resolution的结构体，用来描述一个显示器的像素分辨率。这个结构体包含了两个名为width和height的存储属性。存储属性是被捆绑和存储在类或结构体中的常量或变量。当这两个属性被初始化为整数0的时候，它们会被推断为Int类型。

//在上面的示例中我们还定义了一个名为VideoMode的类，用来描述一个视频显示器的特定模式。这个类包含了四个变量存储属性。第一个是分辨率，它被初始化为一个新的Resolution结构体的实例，属性类型被推断为Resolution。新VideoMode实例同时还会初始化其它三个属性，它们分别是，初始值为false的interlaced，初始值为0.0的frameRate，以及值为可选String的name。name属性会被自动赋予一个默认值nil，意为“没有name值”，因为它是一个可选类型。


//类和结构体实例

let someResolution = Resolution()
let someVideoMode = VideoMode()


print(someVideoMode.resolution.height)
print(someVideoMode.resolution.height)

someVideoMode.resolution.width = 1280
print(someVideoMode.resolution.width)


//结构体类型的成员逐一构造器
let vga = Resolution(width:640, height: 480)

//结构体和枚举是值类型： 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

//类是引用类型: 与值类型不同，引用类型被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。因此，引用的是已存在的实例本身而不是其拷贝

let tenEighty = VideoMode()

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30.0

//因为类是引用类型，所以tenEight和alsoTenEight实际上引用的是相同的VideoModel实例，换句话说，它们是同一个实例的两种叫法

print(tenEighty.frameRate)


/*
 恒等运算符
 因为类是引用类型，有可能有多个常量和变量在幕后同时引用同一个实例。(对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量活着传递到函数时，其值总是会被拷贝。)
 等价于 (===)
 不等价于(!==)
 运用这两个运算符检测两个常量活着变量是否引用同一个实例
 */

if tenEighty === alsoTenEighty {
    print("yes")
}
/*
 “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “等于”表示两个实例的值“相等”或“相同”，判定时要遵照设计者定义的评判标准，因此相对于“相等”来说，这是一种更加合适的叫法。
 */



/*
 类和结构体的选择
 
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 该数据结构的主要目的是用来封装少量相关简单数据值。
 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 该数据结构不需要去继承另一个既有类型的属性或者行为。
 
 */


/*
 字符串、数组、和字典类型的赋值与复制行为
 
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
 
 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
*/


