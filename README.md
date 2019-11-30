# AppLog
Printing Logs in File and present in viewController.

## Usage

```Swift
AppLog.print("Hey error occured")
```

Output:
```
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
⏰ Date: 2019-11-30 10:10:10 +0000
---------------------------------
📄FileName: ~/AppName/AppDelegate.swift
---------------------------------
🔨Function: fetchResource(_:)
---------------------------------
♦️LineNumber: 78
---------------------------------
👨🏻‍💻 Message: Hey error Occured
---------------------------------
*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
```

### Present AppLogViewController
```Swift
extension AppViewController {
    func presentLogsVC() {
        AppLogViewController.present(using: self)
    }
}
```

## Installation: 

Drag and Drop Folder to your project `AppLog`.

Or Individual Files below:
1) `AppLogViewController.swift`
2) `AppLog.swift`
3) `FileHandleOutputStream.swift`
