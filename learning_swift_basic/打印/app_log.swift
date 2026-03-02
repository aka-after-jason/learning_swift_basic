//
//  app_log.swift
//  learning_swift_basic
//
//  Created by Elaine on 2026/3/2.
//

import Foundation

/// 自定义日志框架
enum LogLevel: String {
    case debug = "DEBUG"
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
    case critical = "CRITICAL"
    
    var emoji: String {
        switch self {
        case .debug: return "🔍"
        case .info: return "ℹ️"
        case .warning: return "⚠️"
        case .error: return "❌"
        case .critical: return "💣"
        }
    }
}

class AppLogger {
    // 创建单利
    static let shared = AppLogger()
    private init(){}
    
    var enabledLevels: Set<LogLevel> = [.debug,.info, .warning, .error, .critical]
    
    func log(_ message: String, level: LogLevel = .info, file: String = #file, function: String = #function, line:Int=#line){
        guard enabledLevels.contains(level) else {return}
        
        let fileName = URL(filePath: file).lastPathComponent
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let timestamp = dateFormatter.string(from: Date())
        let logMsg = "[\(timestamp)] \(level.emoji) [\(level.rawValue)] [\(fileName):\(line)] \(function) - \(message)"
        print(logMsg)
        // 在这里可以添加将日志写入文件或发送到服务器的代码
    }
    
    func debug(_ message: String, file:String=#file,function:String=#function,line:Int=#line){
        log(message,level: .debug,file: file,function: function,line: line)
    }
    
    func info(_ message: String, file:String=#file,function:String=#function,line:Int=#line){
        log(message,level: .info,file: file,function: function,line: line)
    }
    
    func warning(_ message: String, file:String=#file,function:String=#function,line:Int=#line){
        log(message,level: .warning,file: file,function: function,line: line)
    }
    
    func error(_ message: String, file:String=#file,function:String=#function,line:Int=#line){
        log(message,level: .error,file: file,function: function,line: line)
    }
    
    func critical(_ message: String, file:String=#file,function:String=#function,line:Int=#line){
        log(message,level: .critical,file: file,function: function,line: line)
    }
}
