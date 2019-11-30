//
//  AppLogViewController.swift
//  MartinsApp
//
//  Created by Neil Jain on 10/12/19.
//  Copyright © 2019 Ratnesh Jain. All rights reserved.
//

import UIKit

class AppLogViewController: UIViewController {

    private lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.isEditable = false
        return textView
    }()
    
    private lazy var doneItem: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneAction(_:)))
        return item
    }()
    
    private lazy var shareItem: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction(_:)))
        return item
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.navigationItem.leftBarButtonItem = doneItem
        self.navigationItem.rightBarButtonItem = shareItem
    }
    
    private func setup() {
        self.view.addSubview(textView)
        textView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        do {
            let url = AppLog.outputPath
            let text = try String(contentsOf: url, encoding: .utf8)
            self.textView.text = text
        } catch {
            print(error)
        }
    }
    
    @objc private func doneAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func shareAction(_ sender: UIBarButtonItem) {
        let item = self.textView.text ?? ""
        let activityController = UIActivityViewController(activityItems: [item], applicationActivities: nil)
        self.present(activityController, animated: true, completion: nil)
    }

}

extension AppLogViewController {
    static func present(using presetingVC: UIViewController) {
        let vc = AppLogViewController()
        let navController = UINavigationController(rootViewController: vc)
        presetingVC.present(navController, animated: true, completion: nil)
    }
}
