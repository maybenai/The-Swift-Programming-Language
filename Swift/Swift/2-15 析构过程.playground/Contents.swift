//: Playground - noun: a place where people can play

import UIKit

/*
 析构过程原理：
 Swift会自动释放不再需要的实例以释放资源。Swift通过自动引用计数处理实例的内存管理。通常当你的实例被释放时不需要手动地去清理。但是，当使用自己的资源时，你可能需要进行一些额外的清理。
 在类的定义中，每个类最多只能有一个析构器，并且析构器不带任何参数
 */

/*
deinit {
    //执行析构过程
}

 析构器是在实例释放发生前被自动调用。你不能主动调用析构器。子类继承了父类的析构器，并且在子类析构器实现的最后，父类的析构器会被调用。即使子类没有提供自己的析构器，父类的析构器也同样会被调用。
 
 因为直到实例的析构器被调用后，实例才会被释放，所以析构器可以访问实例的所有属性，并且可以根据那些属性可以修改它的行为
 
*/

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        
        coinsInBank -= numberOfCoinsToVend
        
        return numberOfCoinsToVend
        
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }

}








