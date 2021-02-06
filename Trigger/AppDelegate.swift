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

  var statusBarItem: NSStatusItem!
  
  // Modify this line to specify a different hotkey chord
  let hotKey = HotKey(key: .grave, modifiers: [.control])

  func applicationDidFinishLaunching(_ aNotification: Notification) {
    // Establish status bar icon and button
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
    
    // Modify this handler to change hotkey behavior
    hotKey.keyDownHandler = {
      let userDir = FileManager.default.homeDirectoryForCurrentUser
      NSWorkspace.shared.open(userDir) // Need to have sandboxing turned OFF for this to work
    }
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }

  /// Quits the utility
  @objc func quit(_ sender: AnyObject?) {
    NSApp.terminate(self)
  }

}

