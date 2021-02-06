//
//  AppDelegate.swift
//  Trigger
//
//  Created by Jared Lindsay on 2/6/21.
//

import Cocoa
import SwiftUI
import HotKey

@main
class AppDelegate: NSObject, NSApplicationDelegate {

  var window: NSWindow!
  var statusBarItem: NSStatusItem!
  let hotKey = HotKey(key: .grave, modifiers: [.control])

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
    
    let menu = NSMenu()
    let quitItem = NSMenuItem()
    quitItem.title = "Quit Trigger"
    quitItem.action = #selector(quit)
    
    menu.addItem(quitItem)
    self.statusBarItem.menu = menu
    
    if let button = self.statusBarItem.button {
      button.image = NSImage(named: "Icon")
    }
    
    hotKey.keyDownHandler = {
      let userDir = FileManager.default.homeDirectoryForCurrentUser
      NSWorkspace.shared.open(userDir)
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  @objc func quit(_ sender: AnyObject?) {
    NSApp.terminate(self)
  }

}

