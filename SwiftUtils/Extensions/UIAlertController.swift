//
//  UIAlertController.swift
//  TimorAir
//
//  Created by DaoNV on 8/23/15.
//  Copyright (c) 2015 Astraler Co., Ltd. All rights reserved.
//

import UIKit

let kAppName: String = {
  let info = NSBundle.mainBundle().infoDictionary!
  let display = info["CFBundleDisplayName"] as? String
  let name = info["CFBundleName"] as? String
  return display ?? name ?? "ALERT"
}()

class AlertController: UIAlertController {
  var window: UIWindow = {
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window.windowLevel = UIWindowLevelAlert + 1
    window.rootViewController = UIViewController()
    window.makeKeyAndVisible()
    return window
  }()
  
  func present() {
    window.rootViewController?.presentViewController(self, animated: true, completion: nil)
  }
  
  func dismiss(completion: (() -> Void)? = nil) {
    dismissViewControllerAnimated(true, completion: completion)
  }
}

public func alert(title title: String? = kAppName, msg: String, from: UIViewController, handler:(() -> Void)? = nil) -> UIAlertController {
  let alert = AlertController(title: title?.localized, message: msg.localized, preferredStyle: UIAlertControllerStyle.Alert)
  let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
    if let handler = handler {
      handler()
    }
  }
  alert.addAction(ok)
  alert.present()
  return alert
}

public func alert(error: NSError?, from: UIViewController? = nil, handler:(() -> Void)? = nil) -> UIAlertController {
  if let error = error {
    let alert = UIAlertController(title: kAppName.localized, message: error.localizedDescription.localized, preferredStyle: UIAlertControllerStyle.Alert)
    let ok = UIAlertAction(title: "OK".localized, style: UIAlertActionStyle.Cancel) { (action) -> Void in
      if let handler = handler {
        handler()
      }
    }
    alert.addAction(ok)
    alert.present()
    return alert
  }
}