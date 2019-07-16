//
//  ViewController.swift
//  Focus
//
//  Created by Darkhonbek Mamataliev on 16/7/19.
//  Copyright © 2019 Darkhonbek Mamataliev. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    private lazy var button: NSButton = {
        let button = NSButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.action = #selector(closeButtonClicked)
        button.title = "Close Apps"

        return button
    }()

    override func loadView() {
        super.loadView()

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100.0),
            button.heightAnchor.constraint(equalToConstant: 20.0)
            ])
    }

    @objc func closeButtonClicked() {
        closeApps()
    }

    func closeApps() {
        var runningApplications = NSWorkspace.shared.runningApplications

        for application in runningApplications {
            if let name = application.localizedName {
                print(name)
                if name == "Activity Monitor" {
//                    kill(application.processIdentifier, SIGKILL)
                    if application.terminate() {
                        print("closed")
                    } else {
                        print("not closed")
                    }
                }
            }
        }

//        if let scriptObject = NSAppleScript(source: quitAppsAppleScript) {
//            if let output: NSAppleEventDescriptor = scriptObject.executeAndReturnError(
//                &error) {
//                print(output.stringValue)
//            } else if (error != nil) {
//                print("error: \(error)")
//            }
//        }
    }


}

