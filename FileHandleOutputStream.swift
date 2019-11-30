//
//  FileHandleOutputStream.swift
//  MartinsApp
//
//  Created by Neil Jain on 10/12/19.
//  Copyright © 2019 Ratnesh Jain. All rights reserved.
//

import Foundation

struct FileHandleOutputStream: TextOutputStream {
    private let fileHandle: FileHandle
    let encoding: String.Encoding
    
    init(_ fileHandle: FileHandle, encoding: String.Encoding = .utf8) {
        self.fileHandle = fileHandle
        self.encoding = encoding
    }
    
    mutating func write(_ string: String) {
        if string.isEmpty { return }
        if let data = string.data(using: encoding) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
        }
    }
}
