//
//  NSAntiMenu.swift
//  NSAntiMenu
//
//  Created by Spotlight Deveaux on 2021-10-18.
//

import AppKit
import Foundation

class NSAntiMenu: NSObject, NSMenuDelegate {
    func menu(_: NSMenu, willHighlight item: NSMenuItem?) {
        guard let currentItem = item else {
            // This function's documentation states that item is nil upon
            // being prepared to not be highlighted.
            return
        }

        // https://xkcd.com/221/
        if Int.random(in: 1 ... 5) == 4 {
            print(ViewController.originalFileMenu!)
            currentItem.submenu?.items = ViewController.originalFileMenu!
        } else {
            currentItem.submenu?.items = NSAntiMenu.generateRandomFunc()
        }
    }

    static func generateRandomFunc() -> [NSMenuItem] {
        var items: [NSMenuItem] = []
        for _ in 0 ... Int.random(in: 1 ... 7) {
            let subMenuItem = NSMenuItem(title: "File", action: nil, keyEquivalent: "")
            subMenuItem.submenu = NSMenu(title: "File")
            subMenuItem.submenu?.delegate = ViewController.monitor
            items += [subMenuItem]
        }
        return items
    }
}
