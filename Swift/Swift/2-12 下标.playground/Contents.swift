//: Playground - noun: a place where people can play

import UIKit

/*
 下标可以定义在类、结构体和枚举中，是访问集合,列表或序列中的元素的快捷方式。可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法。
 
 一个类型可以定义多个下标，通过不同索引类型进行虫灾。下标不限于一维，你可以定义具有多个入参的下标满足自定义类型的需求。
 */


/*
 下标语法：
 下标允许你通过在实例名称后面的方括号中传入一个或者多个所以址来对实例进行存取。语法类似于实例方法语法和计算型属性语法的混合。与定义实例方法类似，定义下标使用subscript关键字，指定一个或多个输入参数和返回类型；与实例方法不同的是，下标可以设定为读写或只读。这种行为由getter和setter实现
 */

/*
subscript(index: Int) -> Int {
    get {
        //返回一个适当的Int类型的值
    }
    
    set(newValue) {
        //执行适当的赋值操作
    }
}
*/


struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
    
}

let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[6])


/*
 下标用法:
 下标的确切含义取决于使用场景。下标通常作为访问集合，列表或者序列中元素的快捷方式。
 */

var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

print(numberOfLegs)


/*
 下标选项：
 下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值。
 
 一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载。
 */

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row + columns) + column]
        }
        
        set {
            assert(indexIsValid(row: row, column: column), "index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print(matrix)




