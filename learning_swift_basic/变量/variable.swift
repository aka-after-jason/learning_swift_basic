//
//  main.swift
//  learning_swift_basic
//
//  Created by Elaine on 2026/3/1.
//

import Foundation

func test(){
    print("Hello, World!")

    // 常量 Swift 推荐使用常量
    let username: String = "Jason"
    print(username)

    // 变量
    var count: Int = 10
    print("数量为\(count)")
    count = 20
    print("count被修改为\(count)")

    // 类型注解与类型推断
    let price = 10.0
    print(price)
    print(type(of: price)) // 使用 type(of:) 函数查看变量的类型

    // 使用类型注解
    let name: String = "Elaine"
    let height: Double = 170
    let isStudent: Bool = false

    // 使用类型推断
    let nickname = "张8斤"

    // Swift 基本数据类型
    // Int 取决于所使用的平台
    print(MemoryLayout<Int>.size) // Int 类型占8位
    print(MemoryLayout<Int32>.size) // 4位
    print(MemoryLayout<Int64>.size) // 8位

    print(MemoryLayout<Character>.size)
    let c: Character = "a"
    print(c)

    // 进制转换
    // 将 2进制 8进制 16进制 转换为10进制
    var res = Int("1010", radix: 2)!
    print("结果为\(res)")

    // 类型转换 Swift 是类型安全的,不同类型之间的转换必须是显示的
    // 例如 将Int型转为String类型
    let num1 = 12
    let str_num1 = String(num1)
    print("值为\(str_num1),类型是\(type(of: str_num1))")

    // 将字符串数字转为数值型
    let int_num1 = Int(str_num1) // 这里的int_num1有可能没有值
    if let num = int_num1 {
        print("值为\(num),类型是\(type(of: num))")
    }else {
        print("不是数字")
    }

    let pi = Double.pi
    let str_pi = String(format: "%.2f", pi) // 保留两位小数
    print(str_pi)

    // 使用 if let 解包
    let str1 = "123a"
    if let num_str1 = Int(str1) {
        print("num_str1的值是\(num_str1)")
    }else{
        print("不能转换")
    }

    // 变量的作用域: 全局,函数作用域,代码作用域
    // 定义一个全局变量
    var global_num = 100
    // 函数作用域
    func hi(){
        print(global_num)
        // 定义函数作用域变量
        let name = "Jason"
        print(name)
        if true {
            // 定义代码块作用域
            let weight = 60
            print(weight)
        }
    }
    print(global_num)


    // 可选类型 Optionals
    var my_name: String? = "Jason"
    var my_age: Int? = 18
    var my_height: Double = 170 //非可选类型

    if let real_name = my_name {
        print(real_name)
    }else{
        print("不能解包")
    }

    print(my_age!)//强制解包

    // 可选类型可以为nil
    //my_name = nil
    //my_age = nil

    //my_height = nil //非可选类型不能设置为nil

    // 使用 if let 进行可选绑定
    if let unwrappedName = my_name {
        print("my name is \(unwrappedName)")
    } else {
        print("不能解包")
    }

    // 定义错误类型
    enum MyError: Error {
        case custom(String)
    }

    // 使用 guard let 进行可选绑定
    func greet(name: String?) throws -> String {
        guard let unwrappedName = name else {
            //return
            throw MyError.custom("输入的值不能为空")
        }
        return unwrappedName
    }

    // 错误处理
    do {
        let result = try greet(name: nil)
        print(result)
    } catch MyError.custom(let errMsg){
        print(errMsg)
    } catch {
        print("未知错误")
    }

    // 使用 nil 合并运算符
    let defaultNmae:String? = "Jason"
    let myName:String? = "余文斌"
    let displayName = myName ?? defaultNmae
    print(displayName!)

    // 可选链
    struct Address {
        var city: String
    }
    struct Person {
        var address: Address?
    }

    let person: Person? = Person(address: Address(city: "深圳"))
    let city = person?.address?.city
    if let my_city = city {
        print(my_city)
    }else{
        print("不知道")
    }

    // 隐式解包
    let computer_name: String! = "Mac"
    let cn: String = computer_name
    print(cn)


    // 属性 : Swift的属性分为存储属性 和 计算属性
    struct Rectangle {
        // 定义存储属性,用来存储实际的值
        var width: Double
        var height: Double
        
        // 定义计算属性
        var area: Double {
            get {
                return width * height
            }
        }
        
        // 同时具有 getter 和 setter 的计算属性
        var perimeter: Double {
            get {
                return 2 * (width + height)
            }
            set(newPerimeter) {
                // 假设宽高比保持不变
                let ratio = width / height
                height = newPerimeter / (2 * (1 + ratio))
                width = height * ratio
            }
        }
    }

    // 实例化
    var rec = Rectangle(width: 2, height: 2)
    print(rec.area)
    print(rec.perimeter)
    rec.perimeter = 4
    print(rec.perimeter)


    // 属性观察器 willSet didSet
    class StepCounter {
        // 带有属性观察器的存储属性
        var totalSteps:Int = 0 {
            willSet(newTotalSteps) {
                print("即将更新步数到\(newTotalSteps)")
            }
            didSet {
                if totalSteps > oldValue {
                    print("新增了\(totalSteps - oldValue)步")
                }
            }
        }
    }

    // 实例化
    var stepCounter = StepCounter()
    stepCounter.totalSteps = 10
    stepCounter.totalSteps = 15



    // 懒加载属性
    class DataManager {
        // 懒加载属性: 直到第一次被访问时才初始化
        lazy var data: [String] = {
        // 这个闭包会在首次访问data时执行
            print("正在加载大量数据...")
            // 模拟加载大量数据
            var res: [String] = [String]()
            for i in 1...1000 {
                res.append("数据项\(i)")
            }
            return res
        }()
    }

    // 初始化
    let dataManager = DataManager() // 此时 data 还未初始化
    print(dataManager.data[1]) // 这里才正式访问

    // 类型属性: 类型属性可以使用 static 关键字(在类中,可以使用class关键字允许子类重写)
    struct SomeStructure {
        // 定义存储类型属性
        static var storedTypeProperty = "某些值"
        // 定义计算类型属性
        static var computedTypeProperty: Int {
            return 100
        }
    }
    // 实例化
    print(SomeStructure.storedTypeProperty)
    print(SomeStructure.computedTypeProperty)

    enum SomeEnumeration {
        static var storedTypeProperty = "某些枚举值"
        static var computedTypeProperty: Int {
            return 200
        }
    }
    print(SomeEnumeration.storedTypeProperty)
    print(SomeEnumeration.computedTypeProperty)

    class SomeClass {
        static var storedTypeProperty = "某些类值"
        static var computedTypeProperty: Int {
            return 300
        }
        
        // 可被子类重写的类型属性
        class var overideableComputedTypeProperty: Int {
            return 400
        }
    }
    print(SomeClass.storedTypeProperty)
    print(SomeClass.computedTypeProperty)
    print(SomeClass.overideableComputedTypeProperty)

}
