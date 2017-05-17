//: Playground - noun: a place where people can play

import UIKit

//定义一个类层次作为例子

//第一个代码片段定义了一个新的基类 MediaItem。这个类为任何出现在数字媒体库的媒体项提供基础功能。特别的，它声明了一个 String 类型的 name 属性，和一个 init(name:) 初始化器。（假定所有的媒体项都有个名称。）

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

//下一个代码段定义了 MediaItem 的两个子类。第一个子类 Movie 封装了与电影相关的额外信息，在父类（或者说基类）的基础上增加了一个 director（导演）属性，和相应的初始化器。第二个子类 Song，在父类的基础上增加了一个 artist（艺术家）属性，和相应的初始化器：

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

//最后一个代码段创建了一个数组常量 library，包含两个 Movie 实例和三个 Song 实例。library 的类型是在它被初始化时根据它数组中所包含的内容推断来的。Swift 的类型检测器能够推断出 Movie 和 Song 有共同的父类 MediaItem，所以它推断出 [MediaItem] 类作为 library 的类型：

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

//数组library的类型被推断为[MediaItem]


//类型检查: 用类型检查操作符(is)来检查一个实例是否属于特定子类型。若实例属于那个子类型，类型检查操作符返回true，否则返回false

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    }else if item is Song {
        songCount += 1
    }
}

print(movieCount,songCount)


/*
 向下转型
 某类型的一个常量或者变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试向下转到它的子类型，用类型转换操作符(as? 或 as!)。
 向下转型可能会失败，类型转型操作符带有两种不同的形式。条件形式as？返回一个你试图向下转型的可选值。强制形式as！把试图向下转型和强制解包。
 条件形式的类型转换总是返回一个可选值，并且若下转是不可能的，可选值将是nil。这使你能够检查向下转型是否成功。
 
 只有你可以确定向下转型一定会成功时，才用as！，当你试图向下转型为一个不正确的类型时，强制形式的类型转换会触发一个运行时错误
 
 */


for item in library {
    if let movie = item as? Movie {
        print("movie:\(movie.name), dir. \(movie.director)")
    }else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}


//Any和AnyObject的类型转换：  Swift为不确定类型提供了两种特殊的类型别名 Any 可以表示任何类型，包括函数类型   AnyObject可以表示任何类类型相关的实例 只有当你确定需要它们的行为和功能时才使用Any和AnyObject

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0,5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })


//注意： Any类型可以表示所有类型的值，包括可选类型。Swift会在你用Any类型来表示一个可选值的时候，给你一个警告。如果你确实想使用Any类型来承载可选值，你可以使用as操作符显示转换为Any







