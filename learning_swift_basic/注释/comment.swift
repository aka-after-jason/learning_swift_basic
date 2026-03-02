//
//  comment.swift
//  learning_swift_basic
//
//  Created by Elaine on 2026/3/2.
//

import Foundation

/// Swift中的几种注释
/// 单行注释 //
/// 多行注释 /* */
/// 文档注释 /// 或者 /** */
/// 特殊标记 MARK TODO FIXME


/*
 多行注释
 */

/**
 文档注释
 */

/// 文档注释


// MARK: - 测试方法
func test_注释(){
    print(getUser(name: "Jason", age: 18))
    getUser(name: "Tom", age: 22, weiht: 68)
    
    markdown()
}


// MARK: - 功能方法
/**
 获取用户信息
 */
func getUser(name:String, age: Int) ->String{
    return "my name is \(name),and im \(age) years old"
}


/// 获取用户信息
/// - Parameters:
///   - name: 姓名
///   - age: 年龄
///   - weiht: 体重
func getUser(name:String, age: Int,weiht:Double){
    print("my name is \(name), and im \(age) years old, my weight is \(weiht) kg")
}


// TODO: - 代办 需要添加一个函数来添加用户

// FIXME: - 这段代码需要优化一下


// MARK: -  文档注释支持 MARKDOWN 语法
/**
 ```func markdown(){}
 ```
 #一级标题
 **粗体**
 *斜体* _斜体_
 > https:www.baidu.com
 */
func markdown(){
    print("文档注释支持markdown语法")
}
