//: Playground - noun: a place where people can play

import UIKit


/*
 泛型是Swift最强大的特性之一，许多Swift的标准库是通过泛型代码构建的。
 */

//下面是一个标准的非翻新函数

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var someInt = 3
var anotherInt = 107

swap(&someInt, &anotherInt)
print(someInt, anotherInt)


//交换两个String类型的值
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
}

//交换两个double的值
func swapTwoDoubles(_ a: inout String , _ b: inout String) {
    let temp = a
    b = a
    a = temp
}


//这样每一种类型的交换都需要写一个，为了简化这样的麻烦，就可以利用泛型

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    b = a
    a = temp
}

swap(&someInt, &anotherInt)

print(someInt, anotherInt)

var someString = "hello"
var anotherString = "world"

swap(&someString, &anotherString)

print(someString, anotherString)


/*
 类型参数：
 在上面的例子中。展位类型T是类型参数的一个例子。类型参数指定并命名一个占位类型，并且紧随在函数名后面，使用一对尖括号括起来
 一旦一个类型参数被指定，你可以用它来定义一个函数的参数类型，或者作为函数的返回类型，还可以用作函数主题中的注释类型。在这些情况下，类型参数会在函数调用时被实际类型所替换。
 可以提供多个类型参数，将它们都写在尖括号中，用逗号分开。
 */


/*
 命名类型参数
 在大多数情况下，类型参数具有一个描述性名字，例如NSDictionary<Key,Value>中的Key和Value，以及Array<Element>中的Element，这就可以告诉阅读代码的人这些类型参数和泛型函数之间的关系。然而，当它们之间没有任何意义的关系时，通常使用单个字母来命名，例如T、U、V
 
 注意：请始终使用大写字母开头的驼峰命名方法来为类型参数命名，以表明它们是占位类型，而不是一个值
 */


/*
 泛型类型：
 除了泛型函数，Swift还允许你定义泛型类型。这些自定义类、结构体和枚举可以适用于任何类型，类似于Array和Dictionary。
 */

//下面编写了一个非泛型版本的栈
struct IntStack {
    var items = [Int]()
    mutating func push (_ item:Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
}

//这个结构体在栈中使用一个名为items的Array属性来存储值。Stack提供了两个方法啊： push和pop，用来向栈中压入值以及从栈中移除值。这些防卫被标记为mutating，因为它们需要修改结构体的items数组。上面的结构体只能用于Int类型。不过，可以定义一个泛型的Stack结构体，从而能够处理任意类型的值。


struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
}

/*
 Element为待提供的类型定义了一个占位名。这种待提供的类型可以在结构体的定义中通过Element来引用。在这个例子中，Element在如下三个地方被用作占位符
 1.创建items属性，使用Element类型的空数组对其进行初始化
 2.指定push方法的唯一参数item的类型必须是Element类型。
 3.指定pop方法的返回值类型必须是Element类型
 
 由于Stack是泛型类型，因此可以用来创建Swift中任意有效类型的栈，就像Array和Dictionary那样。
 */



/*
 扩展一个泛型类型：
 当你扩展一个泛型类型的时候，并不需要在扩展的定义中提供类型参数列表。原始类型定义中声明的类型参数列表在扩展中可以直接使用，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用
 */

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
//topItem属性会返回一个Element类型的可选值。当栈为空的时候，topItem会返回nil；当栈不为空的时候，topItem会返回items数组中的最后一个元素 ..这个扩展并没有定义一个类型参数列表。相反的，Stack类型已有的类型参数名称Element，被用在扩展中来表示计算型属性topItem的可选类型

var stackOfStrings = Stack<String>()

stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

if let topItem = stackOfStrings.topItem {
    print(topItem)
}



/*
 类型约束：
 类型约束可以指定一个类型参数必须继承自指定类，或者符合一个特定的协议或协议组合。
 例如，Swift的Dictionary类型怼字典的健的类型作了些限制。在字典的描述中，字典的健的类型必须是可哈希的。也就是说，必须有一种方法能够唯一的表示它。Dictionary的键之所以要是可哈希的，是为了便于检查字典是否已经包含某个特定键的值。若没有这个要求，Dictionary将无法判断是否可以插入或者替换某个指定键的值，也不能查找到已经储存在字典中的指定键的值。
 为了实现这个要求，一个类型约束被强制加到Dictionary的健类型上，要求其键类型必须符合Hashable协议，这是Swift标准库中定义的一个特定协议。所有的Swift基本类型默认都是可哈希的
 
 当你创建自定义泛型类型时，你可以定义自己的类型约束，这些约束将提供更为强大的泛型编程能力。抽象概念，例如可哈希的，描述的是类型在概念上的特征，而不是它们的显示类型
 */


func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


let strings = ["cat","dog","llama", "parakeet", "terrapin"]

if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print(foundIndex)
}

//用占位符T替换String类型写出具有同样功能的泛型函数

func findInde<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}


//关联类型: 定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分将会非常有用。关联类型为协议中的某个类型提供了一个占位名，其代表的时机类型在协议被采纳时才会被指定。可以通过associatedtype关键字来指定关联类型

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int {get}
    subscript(i: Int) -> ItemType{ get }
}

/*
 Container协议定义了3个任何采纳了该协议的类型必须提供的功能
 1.必须可以通过append(_ :)方法添加一个新元素到容器里
 2.必须可以通过count属性获取容器中元素的数量，并返回一个Int值
 3.必须可以通过索引值类型为Int的下标检索到容器中的每一个元素
 
 这个协议没有指定容器中元素该如何存储，以及元素必须是何种类型。这个协议只指定了三个任何遵从Container协议的类型必须提供的功能。遵从协议的类型在满足这3个条件的情况下也可以提供其它额外的功能
 
 任何遵从Container协议的类型必须能够指定其存储的元素的类型，必须保证只有正确类型的元素可以加进容器中，必须明确通过其下标返回的元素的类型
 
 为了定义这3个条件，Container协议需要在不知道容器中元素的具体类型的情况下引用这种类型。Container协议需要指定任何通过append(_:)方法添加到容器中的元素和容器中的元素是相同类型，并且通过容器下标返回的元素的类型也是这种类型
 
 为了达到这个目的，Container协议声明了一个关联类型ItemType，协作associatedtype ItemType。这个协议无法定义ItemType是什么类型的别名，这个信息将留给遵从协议的类型来提供。尽管如此，ItemType别名提供了一种方式来引用Container中元素的类型，并将之用于append(_:)方法和下标，从而保证任何Container的行为都能干正如预期地被执行
 */


struct IntStack2: Container {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i : Int) -> Int {
        return items[i]
    }
    
}

struct Stack2<Element>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//泛型where语句
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) ->Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0 ..< someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
    return true
}






		