//
//  optional.swift
//  learning_swift_basic
//
//  Created by Elaine on 2026/3/2.
//

import Foundation


/// Swift中可选项 Optionals
/// 主要解决三个问题
/// 1. 显示标记可能没有值的变量
/// 2. 强制开发者处理 "无值" 情况
/// 3. 提高代码的类型安全性
func test_可选项(){
    // 可选类型的声明与初始化
    var optionalName: String?
    var optionalAge: Int?
    
    // 初始化可选类型
    var explicitNil: Int? = nil
    var emptyOptional: String?
    var hasValue: Double? = 3.14
    print(optionalName)
    print(optionalAge)
    print(explicitNil)
    print(emptyOptional)
    print(hasValue)
    
    // 可选类型 与 非可选类型的区别
    // 可选类型 可以为nil
    // 非可选类型不能为nil,必须有值
    var nonOptionalValue: Int = 100
    //nonOptionalValue = nil 报错
    var optionalValue: Int? = 101
    optionalValue = nil // 可以
    
    
    // 处理可选值
    // 可选类型需要"解包"才能访问其中的值
    // Swift 提供多种方法来安全的处理可选值
    // 例如:
    // 强制解包(!)
    // 可选绑定 (if let)
    // 隐式解包 (Type!)
    // 空合运算符(??)
    // 可选链(?.)
    // guard let
    
    var optionalPrice: Int? = 10 // 定义一个可选变量
    
    // 强制解包
    print(optionalPrice!)// 这种情况必须知道有值,否则报错
    
    // 可选绑定
    if let price = optionalPrice {
        print(price)
    }else {
        print("没有值")
    }
    
    // 隐式解包
    let num1: Int! = 10
    print(num1!)
    
    // 空合运算符
    let defaultName:String = "游客"
    let name:String? = "Jason"
    print("欢迎\(name ?? defaultName)")
    
    // guard let
    func checkName(firstName: String?, lastName:String?){
        guard let first = firstName,let last = lastName else {
            print("请输入姓名")
            return
        }
        print("名字为:\(last)\(first)")
    }
    checkName(firstName: "wenbin", lastName: "yu")
    
    
    // 多重绑定
    let firstName:String? = "wenbin"
    let lastName:String? = "yu"
    if let first = firstName,let last = lastName {
        print("名字为: \(last)\(first)")
    }else{
        print("绑定错误哦")
    }
    
    // 带条件的绑定
    let myAge:Int? = 20
    if let a = myAge, a > 18 {
        print("您已成年")
    }else{
        print("未成年")
    }
    
    
    // 可选链
    struct Address {
        var street:String?
        var city:String?
    }
    
    struct Person{
        var name:String?
        var address:Address?
        
        func getGreeting() -> String{
            return "hello"
        }
    }
    
    let p:Person = Person(name: "jason",address: Address(street: "西乡",city: "深圳"))
    print(p.address?.city ?? "")
    
    
    // 可选模式
    // Swift 提供了在模式匹配中处理可选值的特殊语法
    let nums:[Int?] = [1,2,3,nil,4,nil,5,nil,8]
    // 使用 case 来匹配可选值
    for case let number? in nums {
        print(number)
    }
    
    // 使用 if case 匹配特定值
    let computerName:String? = "Mac"
    if case .some(let name) = computerName {
        print("电脑的名字是: \(name)")
    }else{
        print("不能解包")
    }
    
    // 使用 switch 来匹配
    switch computerName {
    case .some(let name) where name.count > 2:
        print("进入条件语句")
    case .some(let name):
        print(name)
    
    case .none:
        print("无值")
        
    }
    
    
}
