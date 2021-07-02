//
//  PreferencesWinController.swift
//  ShadowsocksX-NG
//
//  Created by 邱宇舟 on 2017/3/11.
//  Copyright © 2017年 qiuyuzhou. All rights reserved.
//

import Cocoa
import RxCocoa
import RxSwift

class PreferencesWinController: NSWindowController {
    
    @IBOutlet weak var toolbar: NSToolbar!
    @IBOutlet weak var tabView: NSTabView!
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        let defaults = UserDefaults.standard
        let identifier = defaults.string(forKey: "LastPreferencePane") ?? "general"
        toolbar.selectedItemIdentifier = NSToolbarItem.Identifier(rawValue: identifier)
        tabView.selectTabViewItem(withIdentifier: identifier)
        for item in toolbar.items {
            if item.itemIdentifier == toolbar.selectedItemIdentifier {
                window?.title = item.label
                break
            }
        }
        resetWindowFrame()
    }
    
    @objc func windowWillClose(_ notification: Notification) {
        NotificationCenter.default
            .post(name: NOTIFY_CONF_CHANGED, object: nil)
    }
    
    @IBAction func toolbarAction(sender: NSToolbarItem) {
        tabView.selectTabViewItem(withIdentifier: sender.itemIdentifier)
        window?.title = sender.label
        resetWindowFrame()
        DispatchQueue.global(qos: .utility).async {
            let defaults = UserDefaults.standard
            defaults.setValue(sender.itemIdentifier.rawValue, forKey: "LastPreferencePane")
        }
    }
    
    func resetWindowFrame() {
        if let window = window {
            let contentSize = tabView.fittingSize
            let newWindowSize = window.frameRect(forContentRect: CGRect(origin: .zero, size: contentSize)).size
            var frame = window.frame
            frame.origin.y += frame.height - newWindowSize.height
            frame.size = newWindowSize

            window.setFrame(frame, display: false)
        }
    }

    @IBAction func resetProxyExceptions(sender: NSButton) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "ProxyExceptions")
    }
    
    @IBAction func resetAllPreferences(sender: NSButton) {
        let alert = NSAlert.init()
        alert.alertStyle = .warning;
        alert.messageText = "Are you sure you want to reset the preferences to defaults?".localized
        alert.informativeText = "All your changes of preferences will be lost.".localized
        alert.addButton(withTitle: "OK")
        alert.addButton(withTitle: "Cancel")
        if alert.runModal() == .alertFirstButtonReturn {
            self.resetUserDefaults()
        }
    }
    
    func resetUserDefaults() {
        let domain = Bundle.main.bundleIdentifier!
        let defaults = UserDefaults.standard
        
        // Don't reset server profiles, restore them later.
        let profiles = defaults.array(forKey: "ServerProfiles")
        let activeProfileId = defaults.string(forKey: "ActiveServerProfileId")
        
        defaults.removePersistentDomain(forName: domain)
        defaults.synchronize()
        
        // Restore server profiles.
        defaults.set(profiles, forKey: "ServerProfiles")
        defaults.set(activeProfileId, forKey: "ActiveServerProfileId")
        defaults.synchronize()
    }
}
