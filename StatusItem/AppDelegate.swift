//
//  AppDelegate.swift
//  StatusItem
//
//  Created by Markos Charatzas on 26/09/2017.
//  Copyright © 2017 qnoid. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem! = {
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.isEnabled = true
        let layer = CALayer()
        statusItem.button?.layer = layer
        statusItem.button?.wantsLayer = true
        
        let image = NSImage(named:NSImage.Name(rawValue: "statusItem"))
        image?.isTemplate = true
        statusItem.button?.layer?.contents = image

        return statusItem
    }()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let basicAnimation = CABasicAnimation(keyPath:"transform.rotation")
        basicAnimation.fromValue = 2.0 * .pi
        basicAnimation.toValue = 0.0
        basicAnimation.duration = 1.0
        basicAnimation.repeatCount = Float.infinity
        
        statusItem.button?.layer?.add(basicAnimation, forKey: "spinAnimation")
        statusItem.button?.layer?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

