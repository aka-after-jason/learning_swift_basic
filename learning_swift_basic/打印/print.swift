//
//  print.swift
//  learning_swift_basic
//
//  Created by Elaine on 2026/3/1.
//

import Foundation

func test_打印(){
    
    
    //print_dump_debugPrint()
    
    // 基本字符串插值的使用
    //demo1()
    
    //demo2()
    
    //demo3()
    
    //demo4()
    
    // 自定义日志框架的使用示例
    let logger = AppLogger.shared
    logger.debug("这是一条调试信息")
    logger.info("用户成功登录")
    logger.warning("这是一条警告信息")
    logger.error("这是一条错误信息")
    logger.critical("这是致命错误")
    
    // 修改日志级别
    logger.enabledLevels = [.error, .critical] //只显示错误和严重错误
    logger.debug("这条消息看不到")
    logger.error("这条消息将会展示")
    
}

/// 自定义日志框架


/// 自定义打印
/// Swift 提供了几个协议,可以让你自定义类型的打印表现形式
func demo4(){
    // CustomStringConvertible 协议
    // CustomDebugStringConvertible 协议
    struct Book: CustomStringConvertible, CustomDebugStringConvertible {
        let titile: String
        let author: String
        let year: Int
        let pages: Int
        
        // 自定义 description 属性
        var description: String {
            return "\(titile) by \(author) (\(year))"
        }
        
        // 自定义 debugDescription 属性
        var debugDescription: String {
            return "Book(title:\(titile), author:\(author), year:\(year), pages:\(pages))"
        }
    }
    
    // 创建一本书
    let swiftBook = Book(titile: "Swift Programming", author: "Apple Inc.", year: 2021, pages: 500)
    print(swiftBook) // 普通打印
    debugPrint(swiftBook) // 调试打印
}

/// 自定义字符串插值(Swift5+)
func demo3(){
    let pi = 3.14159265359
    print("pi 保留两位小数: \(pi,precision: 2)")
    print("价格: \(currency: 1099.99)") // 根据当前语言环境显示相应货币
}

/// 自定义格式化扩展
extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: Double, precision: Int){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = precision
        if let result = numberFormatter.string(from: NSNumber(value: value)) {
            appendLiteral(result)
        }
    }
    
    mutating func appendInterpolation(currency value: Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        if let result = numberFormatter.string(from: NSNumber(value: value)) {
            appendLiteral(result)
        }
    }
}

/// 字符串插值与格式
/// 高级格式化
func demo2(){
    let number = 123.456789
    
    // 数字格式化
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 2
    print("格式化数字: \(formatter.string(from: NSNumber(value: number)) ?? "")")
    
    // 百分比
    formatter.numberStyle = .percent
    print("百分比: \(formatter.string(from: 0.75 as NSNumber) ?? "")")
    
    // 货币
    formatter.numberStyle = .currency
    formatter.locale = Locale(identifier: "zh_CN")
    print("货币: (中国) \(formatter.string(from: 1234.56 as NSNumber) ?? "")")
    
    
    // 日期格式化
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .full
    dateFormatter.timeStyle = .medium
    print("完整日期: \(dateFormatter.string(from: date))")
    
    // 自定义日期格式
    dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
    print("自定义日期: \(dateFormatter.string(from: date))")
}


/// 字符串插值与格式
/// 基本字符串插值
func demo1(){
    let name = "Swift"
    let version = 5.5
    let year = 2021
    
    // 基本插值
    print("Welcome to \(name) \(version) released in \(year)")
    
    // 在插值中使用表达式
    print("Next year will be \(year+1)")
    print("Version after 5 years: \(version+5)")
    
    // 使用三元运算符
    let isNew = true
    print("This version is \(isNew ? "new" : "old")")
}

/// print dump debugPrint 的使用
func print_dump_debugPrint(){
    // Swift中的打印 : print() dump() debugPrint()
    // print() 函数
    
    // 基本用法
    print("Hello,World!")
    // 多个参数
    print("Name:","Swift","Version:",5.5)
    // 自定义分隔符
    print("Swift","is","awesome",separator: "-")
    // 自定义终止符(默认是换行符)
    print("This won't end with a newline", terminator: "")
    print(" and this will contine on the same line")
    // 打印不同类型
    let number = 100
    let boolean = true
    let array = [1,2,3]
    print("Number:",number,"Boolean:",boolean,"Array:",array)
    
    
    // dump()函数 用于显示对象的详细结构
    struct Person {
        let name: String
        let age: Int
        let hobbies: [String]
    }
    
    // 创建实例
    let person = Person(name: "Jason", age: 18, hobbies: ["Reading","Coding","Hiking"])
    print(person)
    dump(person)
    //限制输出深度
    dump(person,name: "人物信息",maxDepth: 2)
    
    
    // debugPrint() 类似于print(),但会调用类型的 debugDescription 而不是 description,通常会提供更多调试信息
    let text = "hello"
    let nums = [1,2,3]
    print(text)
    print(nums)
    debugPrint(text)
    debugPrint(nums)
}
