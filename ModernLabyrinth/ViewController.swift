//
//  ViewController.swift
//  ModernLabyrinth
//
//  Created by Spotlight Deveaux on 2021-10-18.
//

import Cocoa

class ViewController: NSViewController {
    static let monitor = NSAntiMenu()
    static var originalFileMenu: [NSMenuItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        let newFileMenu = NSMenuItem()
        let fileMenuItem = NSMenu(title: "File")
        fileMenuItem.delegate = ViewController.monitor
        newFileMenu.submenu = fileMenuItem
        newFileMenu.submenu?.items = NSAntiMenu.generateRandomFunc()

        // Preserve existing File
        for item in NSApplication.shared.mainMenu!.items {
            if item.title == "File" {
                ViewController.originalFileMenu = item.submenu?.items
            }
        }

        NSApplication.shared.mainMenu?.removeItem(at: 1)
        NSApplication.shared.mainMenu?.insertItem(newFileMenu, at: 1)
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
