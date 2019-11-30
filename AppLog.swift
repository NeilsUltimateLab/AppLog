//
//  AppLog.swift
//  MartinsApp
//
//  Created by Neil Jain on 10/12/19.
//  Copyright © 2019 Ratnesh Jain. All rights reserved.
//

import Foundation

struct AppLog {
    let fileName: StaticString
    let functionName: StaticString
    let lineNumber: Int
    let message: String
    let date: Date
    
    static var stream: FileHandleOutputStream = {
        do {
            if !FileManager.default.fileExists(atPath: AppLog.outputPath.path) {
                FileManager.default.createFile(atPath: AppLog.outputPath.path, contents: nil, attributes: nil)
            }
            let stream = try FileHandleOutputStream(FileHandle(forUpdating: AppLog.outputPath))
            return stream
        } catch (let error) {
            Swift.print(error)
            fatalError()
        }
    }()
}

extension AppLog: CustomStringConvertible {
    var description: String {
        return """
        *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
        ⏰ Date: \(date)
        ---------------------------------
        📄FileName: \(fileName)
        ---------------------------------
        🔨Function: \(functionName)
        ---------------------------------
        ♦️LineNumber: \(lineNumber)
        ---------------------------------
        👨🏻‍💻 Message: \(message)
        ---------------------------------
        *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
        """
    }
}

extension AppLog {
    
    static var outputPath: URL {
        guard let path = try? FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true)
        else {
            fatalError()
        }
        return path.appendingPathComponent("AppLog.txt")
    }
    
    static func print(_ 
        message: String,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line,
        date: Date = Date()
    ) {
        let log = AppLog(fileName: fileName,
                         functionName: functionName,
                         lineNumber: lineNumber,
                         message: message,
                         date: date)
        Swift.print(log.description, to: &AppLog.stream)
    }
    
    static func print(_
        message: Any,
        extraInfo: Any? = nil,
        fileName: StaticString = #file,
        functionName: StaticString = #function,
        lineNumber: Int = #line,
        date: Date = Date()
    ) {
        let log = AppLog(fileName: fileName,
                         functionName: functionName,
                         lineNumber: lineNumber,
                         message: String(describing: message),
                         date: date)
        var logDescription = log.description
        if let extraInfo = extraInfo {
            logDescription += "\nExtraInfo: \(String(describing: extraInfo))"
        }
        Swift.print(logDescription, to: &AppLog.stream)
    }
}
