//: Playground - noun: a place where people can play

import UIKit

/***************************************************
 *
 *          集合类型
 *
 ***************************************************/

/*Swift语言提供了Arrays、Sets和Dictionary三种基本的集合类型用来存储集合数据。
 1.数组(Array)是有序数据的集
 2.集合（Sets）是无序无重复数据的集
 3.字典（Dictionary）是无序的键值对的集
 
 如果创建一个Arrays、Sets或Dictionaries并且把它分配成一个变量，这个集合将是可变的。这意味着我们可以在创建之后添加更多或移除已存在的数据项，或者改变集合中的数据项。如果我们把Arrays、Sets或Dictionaries分配成常量，那么它就是不可变的，它的大小和内容都不能被改变
 */



//数组（Arrays）  数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置
//数组的简单语法， 通过构造函数的类型，someInts的值类型被推断为Int
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
//如果代码上下文中已经提供了类型信息，例如一个函数参数或者一个已经定义好类型的常量或者变量，我们可以使用空数组语句创建一个空数组
someInts.append(3)
someInts = []

//创建一个带有默认值的数组
//Swift中的Array类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。我们可以把准备加入新数组的数据项数量（count）和适当类型的初始值（repeating）传入数组构造函数
var threeDoubles = Array(repeatElement(0.0, count: 3))


//通过两个数组相加创建一个数组
//我们可以使用加法操作符（+）来组合两种已存在的相同类型数组。新数组的数据类型会被从两个数组的数据类型中推断出来：
var anotherThreeDoubles = Array(repeatElement(2.5, count: 3))
var sixDoubles = threeDoubles + anotherThreeDoubles

//用数组字面量构造数组
var shoppingList:[String] = ["eggs","milk"]
print("the shoppingList ontains \(shoppingList.count) items")

//用isEmpty去检查count属性是否为0
if shoppingList.isEmpty {
    print("empty")
}else{
    print("no")
}

//用append(_:)方法在数组后面添加新的数据项
shoppingList.append("four")

//也可以使用加法赋值运算符（+=）直接在数组后面添加一个或多个拥有相同类型的数据项
shoppingList += ["baking power"]

shoppingList += ["chocolate spread", "cheese", "butter"]

//可以直接使用下标语法来获取数组中的数据项
var firstItem = shoppingList[0]

//我们也可以用下标来改变某个已有索引值对应的数据值
shoppingList[0] = "six eggs"
print(shoppingList)

//还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的。
shoppingList[4...6] = ["bananas","apples"]
print(shoppingList)

//调用数组的insert(_:at:)方法来在某个具体索引值之前添加数据项
shoppingList.insert("Maple syrup", at: 0)
//调用数组的insert(_:at:)方法调用把值为“Maple syrup”的新数据项插入列表的最开始位置，并且使用0作为索引值


//我们可以用remove(at:)方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项
let mapleSyrup = shoppingList.remove(at: 0)


//数组的遍历

for item in shoppingList {
    print(item)
}

//如果我们同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历。enumerated()返回一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或变量来进行遍历

for (index, value) in shoppingList.enumerated() {
    print("item \(String(index + 1)) : \(value)")
}



//集合Sets: 集合（Set）用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或着希望确保每个元素只出现一次时可以使用集合而不是数组
//一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a = b，因此a.hashValue = b.hashValue
//Swift的所有基本类型默认都是可哈希化的，可以作为集合的值的类型或者字典的键的类型。没有关联值的枚举成员值默认也是可哈希化的。

//集合类型语法
//创建和构造一个空的集合
var letters = Set<Character>()
print(letters)

letters.insert("a")

//用数组字面量创建集合
var favoriteGenres:Set<String> = ["rock", "classical","hip hop"]

//一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显示声明。如果一个数组内所有字面量中元素类型相同，那么无需写出Set的具体类型。
var favoriteGenres2:Set = ["rock", "classical","hip hop"]


//访问和修改一个集合
print(favoriteGenres.count)

if favoriteGenres.isEmpty {
    print("empty")
}else{
    print("no")
}

favoriteGenres.insert("jazz")

if let removeGenre = favoriteGenres.remove("classical") {
    print("yes")
}else{
    print("no")
}

//使用contains(_:)方法去检查Set中是否包含一个特定的值

if favoriteGenres.contains("funk") {
    print("yes")
}else{
    print("no")
}


//遍历一个集合
for genre in favoriteGenres {
    print("\(genre)")
}

//Swift的Set类型没有确定的顺序，为了按照特定的顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符‘<’对元素进行比较的结果来确定

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

/**
 基本操作:
 1.使用intersetion(_:)方法根据两个集合中都包含的值创建一个新的集合
 2.使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
 3.使用union(_:)方法根据两个集合的值创建一个新的集合。
 4.使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
 */

let oddDigits: Set = [1,3,5,7,9]
let evenDigits: Set = [0,2,4,6,8]
let singleDigitPrimeNumbers: Set = [2,3,5,7]

//合并2个集合
oddDigits.union(evenDigits).sorted()
//用2个集合中都有的数创建一个新集合
oddDigits.intersection(evenDigits).sorted()

//根据singleDigitPrimeNumbers没有subtracting的数据创建一个集合
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

//在oddDigits却不在singleDigitPrimeNumbers中创建一个集合
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()


/**
 1.使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 2.使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 3.使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
 4.使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 5.使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true



//字典
//创建一个空字典
var namesOfIntegers = [Int: String]() //键是Int，值是String

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
//如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，计作[:]

//用字典字面量创建字典: 这是一种将一个或多个键值对写作Dictionary集合的快捷途径

var airports:[String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//访问和修改字典
print(airports.count)

if airports.isEmpty {
    print("yes")
}else{
    print("no")
}

//添加新的数据项
airports["LHR"] = "London"
print(airports.count)


if let oldValues = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print(oldValues)
}

//删除数据项

if let removeValue = airports.removeValue(forKey: "DUB") {
    print(removeValue)
}

//字典遍历

for (airportCode, airportName) in airports {
    print("\(airportCode) :\(airportName)")
}


for airportCode in airports.keys {
    print(airportCode)
}

for airportName in airports.values {
    print(airportName)
}

let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)



