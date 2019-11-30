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

### With extra information
```Swift
func addItem(request: ItemRequest, completion: @escaping (Result<AppResponse<Int>, ResponseError>)->Void) {
    apiProvider.request(.addItem(request)) { (result) in
        switch result {
        case .success(let response):
            do {
            ... try ...
            } catch {
                completion(.failure(.canNotParse))
                AppLog.print(error, extraInfo: self.extraLogInfo(request: timeRequest))
            }
        case .failure(let error):
            ...
        }
    }
}
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

Or Individual Files:
1) `AppLogViewController.swift`
2) `AppLog.swift`
3) `FileHandleOutputStream.swift`
